class PostulacionesController < ApplicationController
  before_action :set_postulacion, only: [:show, :edit, :update, :destroy]

  # GET /postulaciones
  # GET /postulaciones.json
  def index
		authorize! :index, Postulacion
	  @postulaciones = Postulacion.where('proyecto_id = ?', params[:proyecto_id]).order(:created_at)
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /postulaciones/1
  # GET /postulaciones/1.json
  def show
		authorize! :show, Postulacion
  end

  # GET /postulaciones/new
  def new
		authorize! :new, Postulacion
    @postulacion = Postulacion.new
    @postulacion.aceptado=false
  end

  # GET /postulaciones/1/edit
  def edit
		authorize! :edit, Postulacion
  end

  # POST /postulaciones
  # POST /postulaciones.json
  def create
		authorize! :create, Postulacion
    @postulacion = Postulacion.new(postulacion_params)
    @postulacion.aceptado=false

    respond_to do |format|
      if @postulacion.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Creación de la Postulación al proyecto ' +@postulacion.proyecto.nombre +' del usuario '+ @postulacion.usuario.nombreUsuario+ ': aceptado = ' +@postulacion.aceptado,
		    sesion_id: sesion.id ,
		    proyecto_id: @postulacion.proyecto.id)
	format.html {redirect_to :controller => 'proyectos', :action => 'index'
	      flash[:notice] = 'Se ha registrado tu participación'  } 
        format.json { render :show, status: :created, location: @postulacion }
      else
        format.html { render :new }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulaciones/1
  # PATCH/PUT /postulaciones/1.json
  def update
		authorize! :update, Postulacion
    respond_to do |format|
      if @postulacion.update(postulacion_params)
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Actualización de la Postulación al proyecto ' +@postulacion.proyecto.nombre +' del usuario '+ @postulacion.usuario.nombreUsuario+ ': ' +@postulacion.previous_changes ,
		    sesion_id: sesion.id ,
		    proyecto_id: @postulacion.proyecto.id)
        format.html { redirect_to @postulacion, notice: 'Postulacion fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @postulacion }
      else
        format.html { render :edit }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulaciones/1
  # DELETE /postulaciones/1.json
  def destroy
		authorize! :destroy, Postulacion
    @postulacion.destroy
    respond_to do |format|
      format.html { redirect_to postulaciones_url, notice: 'Postulacion fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def aceptar
    @postulacion = Postulacion.find(params[:id])
    @postulacion.aceptar
    @postulacion.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Aceptación de la Postulación al proyecto ' +@postulacion.proyecto.nombre +' del usuario '+ @postulacion.usuario.nombreUsuario+ ': aceptado = ' +@postulacion.aceptado ,
		    sesion_id: sesion.id ,
		    proyecto_id: @postulacion.proyecto.id)
    respond_to do |format|
	    format.html {redirect_to :controller => 'asignacion_roles', :action => 'new', notice: 'Se ha registrado tu participación', :proyecto_id => @postulacion.proyecto.id, :usuario_id => @postulacion.usuario.id  } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion
      @postulacion = Postulacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulacion_params
      params.require(:postulacion).permit(:aceptado, :proyecto_id, :usuario_id)
    end
end
