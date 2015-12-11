class HistorialEstadoActividadesController < ApplicationController
  before_action :set_historial_estado_actividad, only: [:show, :edit, :update, :destroy]
  after_action :notificar_cambio, only: [:create, :update]
  # GET /historial_estado_actividades
  # GET /historial_estado_actividades.json
  def index
		
    @actividad = Actividad.find(params[:actividad_id])
    @proyecto = @actividad.proyecto
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @proyecto).count == 1
			raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :index).include?(@actividad.historial_estado_actividades.first)
		else
			authorize! :index, HistorialEstadoActividad
		end
  end

  # GET /historial_estado_actividades/1
  # GET /historial_estado_actividades/1.json
  def show
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @historial_estado_actividad.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @historial_estado_actividad.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :show).include?(@historial_estado_actividad)
		else
			authorize! :show, HistorialEstadoActividad
		end

  end

  # GET /historial_estado_actividades/new
  def new
		authorize! :new, HistorialEstadoActividad
    @historial_estado_actividad = HistorialEstadoActividad.new
  end

  # GET /historial_estado_actividades/1/edit
  def edit
		@proyecto = @historial_estado_actividad.actividad.proyecto
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @proyecto).count == 1
			raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :edit).include?(@historial_estado_actividad)
		else
			authorize! :edit, HistorialEstadoActividad
		end
	  
	  @estados_posibles = EstadoActividad.estados_posibles(@historial_estado_actividad.actividad)
  end

  # POST /historial_estado_actividades
  # POST /historial_estado_actividades.json
  def create
		
    @historial_estado_actividad = HistorialEstadoActividad.new(historial_estado_actividad_params)
		raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :create).include?(@historial_estado_actividad)
    respond_to do |format|
      if @historial_estado_actividad.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: "Creación del Historial Estado Actividad de la actividad #{@historial_estado_actividad.actividad.nombre} al estado actividad #{@historial_estado_actividad.estado_actividad.nombre}: #{@historial_estado_actividad.attributes}" ,
		    sesion_id: sesion.id ,
		    proyecto_id: @historial_estado_actividad.actividad.proyecto.id)
        format.html { redirect_to @historial_estado_actividad 
		      flash[:success] = 'Historial estado actividad fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @historial_estado_actividad }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_actividades/1
  # PATCH/PUT /historial_estado_actividades/1.json
  def update
		
    @historial_estado_actividad_nuevo = HistorialEstadoActividad.new
    @historial_estado_actividad_nuevo.actividad_id = params[:historial_estado_actividad][:actividad_id]
    @historial_estado_actividad_nuevo.estado_actividad_id = params[:historial_estado_actividad][:estado_actividad_id]
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @historial_estado_actividad_nuevo.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @historial_estado_actividad_nuevo.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :update).include?(@historial_estado_actividad_nuevo.actividad.historial_estado_actividades.first)
		else
			authorize! :update, HistorialEstadoActividad
		end
    respond_to do |format|
      if @historial_estado_actividad_nuevo.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: "Actualización del Historial Estado Actividad de la actividad #{@historial_estado_actividad_nuevo.actividad.nombre} al estado actividad #{@historial_estado_actividad_nuevo.estado_actividad.nombre}: #{@historial_estado_actividad_nuevo.previous_changes}",
		    sesion_id: sesion.id ,
		    proyecto_id: @historial_estado_actividad_nuevo.actividad.proyecto.id)
	      format.html { redirect_to action: 'index', actividad_id: @historial_estado_actividad.actividad.id 
		    flash[:success] = 'Historial estado actividad fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @historial_estado_actividad }
      else
        format.html { render :edit}
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_actividades/1
  # DELETE /historial_estado_actividades/1.json
  def destroy
		raise CanCan::AccessDenied if !HistorialEstadoActividad.accessible_by(current_ability, :destroy).include?(@historial_estado_actividad)
    @historial_estado_actividad.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_actividades_url
flash[:success] = 'Historial estado actividad fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_actividad
      @historial_estado_actividad = HistorialEstadoActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_actividad_params
      params.require(:historial_estado_actividad).permit(:fechaCambioEstado, :esActual, :actividad_id, :estado_actividad_id)
    end
    def notificar_cambio 
      @usuarios = @historial_estado_actividad.usuarios_actividad
      @usuarios.each do |usuario|
        p usuario.apellido_nombre
        @notificacion = Notificacion.new()
        @notificacion.usuario_creador = current_usuario
        @notificacion.usuario_destino = usuario
        @notificacion.type = "NotificacionSistema"
        @notificacion.notificado = false
        @notificacion.esActiva = true
        @notificacion.mensaje = "El Estado de la Actividad " + @historial_estado_actividad.actividad.to_s + " ha sido establecido en " + @historial_estado_actividad.estado_actividad.nombre.to_s + "."
        @notificacion.proyecto_id = @historial_estado_actividad.actividad.proyecto_id
        @notificacion.save
      end
    end

end
