class AsignacionRolesController < ApplicationController
  before_action :set_asignacion_rol, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_roles
  # GET /asignacion_roles.json
  def index
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /asignacion_roles/1
  # GET /asignacion_roles/1.json
  def show
  end

  # GET /asignacion_roles/new
  def new
    @roles = Rol.all
    @asignacion_rol = AsignacionRol.new(:usuario_id => params[:usuario_id], :proyecto_id => :proyecto_id)
  end

  # GET /asignacion_roles/1/edit
  def edit
    @roles = Rol.all
    respond_to do |format|
      format.js {render partial: 'edit', content_type: 'text/html' }
    end
  end

  # POST /asignacion_roles
  # POST /asignacion_roles.json
  def create
    @asignacion_rol = AsignacionRol.new(asignacion_rol_params)
    @asignacion_rol.esActual = true
    respond_to do |format|
      if @asignacion_rol.save
	format.html {redirect_to :controller => 'asignacion_roles', :action => 'index',:proyecto_id => @asignacion_rol.proyecto.id } 
        format.json { render :show, status: :created, location: @asignacion_rol }
      else
        format.html { render :new }
        format.json { render json: @asignacion_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_roles/1
  # PATCH/PUT /asignacion_roles/1.json
  def update
    @asignacion_rol_viejo = AsignacionRol.find(@asignacion_rol.id)
    @asignacion_rol_viejo.esActual=false
    @asignacion_rol_new = AsignacionRol.new
    @asignacion_rol_new.proyecto = @asignacion_rol_viejo.proyecto
    @asignacion_rol_new.rol_id = params[:asignacion_rol][:rol_id]
    @asignacion_rol_new.esActual=true
    @asignacion_rol_new.usuario=@asignacion_rol.usuario
    @asignacion_rol_new.save
    respond_to do |format|
      if @asignacion_rol_viejo.save
	format.js   { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @asignacion_rol.proyecto.id } 
        format.html { redirect_to @asignacion_rol, notice: 'Asignacion rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignacion_rol }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_roles/1
  # DELETE /asignacion_roles/1.json
  def destroy
    @proyecto_id = @asignacion_rol.proyecto.id
    @asignacion_rol.save
    respond_to do |format|
      format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @proyecto_id
		    flash[:notice] = 'El usuario fue desasignado de su rol.' }
      format.json { head :no_content }
    end
  end

  def dar_baja 
    @asignacion_rol = AsignacionRol.find(params[:id])
    @asignacion_rol.esActual = false
    @asignacion_rol.save
    respond_to do |format|
      format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @asignacion_rol.proyecto.id, notice: 'El usuario fue desasignado de su rol.'
		     flash[:notice] = 'La asignación fue dada de baja satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_rol
      @asignacion_rol = AsignacionRol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_rol_params
      params.require(:asignacion_rol).permit(:fechaCambioEstado, :esActual, :rol_id, :proyecto_id, :usuario_id)
    end
end
