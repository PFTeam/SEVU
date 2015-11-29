class HistorialEstadoProyectosController < ApplicationController
  before_action :set_historial_estado_proyecto, only: [:show, :edit, :update, :destroy]
  after_action :notificar_cambio, only: [:create, :update]
  # GET /historial_estado_proyectos
  # GET /historial_estado_proyectos.json
  def index
		authorize! :index, HistorialEstadoProyecto
    @proyecto = Proyecto.find(params[:proyecto_id])
    @historial_estado_proyectos = HistorialEstadoProyecto.all
  end

  # GET /historial_estado_proyectos/1
  # GET /historial_estado_proyectos/1.json
  def show
		raise CanCan::AccessDenied if !HistorialEstadoProyecto.accessible_by(current_ability, :show).include?(@historial_estado_proyecto) 
  end

  # GET /historial_estado_proyectos/new
  def new
		authorize! :new, HistorialEstadoProyecto
    @historial_estado_proyecto = HistorialEstadoProyecto.new
  end

  # GET /historial_estado_proyectos/1/edit
  def edit
		raise CanCan::AccessDenied if !HistorialEstadoProyecto.accessible_by(current_ability, :edit).include?(@historial_estado_proyecto) 
	  @proyecto = Proyecto.find(params[:proyecto_id])
	  @estados_posibles = EstadoProyecto.estados_posibles(@proyecto)
  end

  # POST /historial_estado_proyectos
  # POST /historial_estado_proyectos.json
  def create
		authorize! :create, HistorialEstadoProyecto
    @historial_estado_proyecto = HistorialEstadoProyecto.new(historial_estado_proyecto_params)

    respond_to do |format|
      if @historial_estado_proyecto.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: "Creación del Historial Estado Proyecto del proyecto #{@historial_estado_proyecto.proyecto.nombre} al estado proyecto #{@historial_estado_proyecto.estado_proyecto.nombre}: #{@historial_estado_proyecto.attributes}" ,
		    sesion_id: sesion.id ,
		    proyecto_id: @historial_estado_proyecto.proyecto.id)
        format.html { redirect_to @historial_estado_proyecto
		     flash[:success] = 'Historial estado proyecto fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @historial_estado_proyecto }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_proyectos/1
  # PATCH/PUT /historial_estado_proyectos/1.json
  def update
		raise CanCan::AccessDenied if !HistorialEstadoProyecto.accessible_by(current_ability, :update).include?(@historial_estado_proyecto) 
    @historial_estado_proyecto_nuevo = HistorialEstadoProyecto.new
    @historial_estado_proyecto_nuevo.proyecto_id = params[:historial_estado_proyecto][:proyecto_id]
    @historial_estado_proyecto_nuevo.estado_proyecto_id = params[:historial_estado_proyecto][:estado_proyecto_id]
    respond_to do |format|
      #if @historial_estado_proyecto.update(historial_estado_proyecto_params)
	    if @historial_estado_proyecto_nuevo.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: "Actualización del Historial Estado Proyecto del proyecto #{@historial_estado_proyecto_nuevo.proyecto.nombre} al estado proyecto #{@historial_estado_proyecto_nuevo.estado_proyecto.nombre}: #{@historial_estado_proyecto_nuevo.previous_changes}" ,
		    sesion_id: sesion.id ,
		    proyecto_id: @historial_estado_proyecto_nuevo.proyecto.id)
		    format.html { redirect_to action: 'index', proyecto_id: @historial_estado_proyecto.proyecto.id
		    flash[:success] = 'Historial estado proyecto fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @historial_estado_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_proyectos/1
  # DELETE /historial_estado_proyectos/1.json
  def destroy
		raise CanCan::AccessDenied if !HistorialEstadoProyecto.accessible_by(current_ability, :destroy).include?(@historial_estado_proyecto) 
    @historial_estado_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_proyectos_url
flash[:success] = 'Historial estado proyecto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def modificar
		authorize! :modificar, HistorialEstadoProyecto
	  @proyecto = Proyecto.find(params[:proyecto_id])
	  @estados_posibles = @proyecto.historial_estado_proyectos.last.estado_proyecto.estados_posibles(@proyecto)
    	  @historial_estado_proyecto = HistorialEstadoProyecto.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_proyecto
      @historial_estado_proyecto = HistorialEstadoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_proyecto_params
      params.require(:historial_estado_proyecto).permit(:fechaCambioEstado, :esActual, :estado_proyecto_id, :proyecto_id)
    end

    def notificar_cambio 
      @proyecto = @historial_estado_proyecto.proyecto

      @usuarios = []

      @proyecto.asignacion_roles.each do |asignacion|
        if asignacion.active == true && asignacion.esActual == true
          @usuarios = @usuarios + asignacion.usuario.to_a
        end
      end

      @usuarios.uniq.each do |usuario|
        p usuario.apellido_nombre
        @notificacion = Notificacion.new()
        @notificacion.usuario_creador = current_usuario
        @notificacion.usuario_destino = usuario
        @notificacion.type = "NotificacionSistema"
        @notificacion.notificado = false
        @notificacion.esActiva = true
        @notificacion.mensaje = "El Estado del Proyecto " + @proyecto.nombre.to_s + " ha sido establecido en " + @historial_estado_proyecto.estado_proyecto.nombre.to_s + "."
        @notificacion.save
      end
    end



end
