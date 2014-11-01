class AsignacionRolesController < ApplicationController
  before_action :set_asignacion_rol, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_roles
  # GET /asignacion_roles.json
  def index
		authorize! :index, AsignacionRol
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /asignacion_roles/1
  # GET /asignacion_roles/1.json
  def show
		authorize! :show, AsignacionRol
  end

  # GET /asignacion_roles/new
  def new
		authorize! :new, AsignacionRol
    @roles = Rol.all
    @proyecto = Proyecto.find(params[:proyecto_id])
    @asignacion_rol = AsignacionRol.new(:usuario_id => params[:usuario_id], :proyecto_id => :proyecto_id)
  end

  # GET /asignacion_roles/1/edit
  def edit
		authorize! :edit, AsignacionRol
    @roles = Rol.all
  end

  # POST /asignacion_roles
  # POST /asignacion_roles.json
  def create
		authorize! :create, AsignacionRol
    @asignacion_rol = AsignacionRol.new(asignacion_rol_params)
    @asignacion_rol.esActual = true
    if unica(@asignacion_rol.usuario_id,@asignacion_rol.proyecto_id, @asignacion_rol.rol_id) == true
	    respond_to do |format|
	      if @asignacion_rol.save
		format.html {redirect_to :controller => 'asignacion_roles', :action => 'index',:proyecto_id => @asignacion_rol.proyecto.id } 
		format.json { render :show, status: :created, location: @asignacion_rol }
	      else
		format.html { render :new }
		format.json { render json: @asignacion_rol.errors, status: :unprocessable_entity }
	      end
	    end
    else
	    respond_to do |format|

		    format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @asignacion_rol.proyecto.id
		             flash[:notice] = 'El usuario ya se encuentra asignado' } 
	    end
    end
  end

  # PATCH/PUT /asignacion_roles/1
  # PATCH/PUT /asignacion_roles/1.json
  def update
		authorize! :update, AsignacionRol
    @asignacion_rol_viejo = AsignacionRol.find(@asignacion_rol.id)
    @asignacion_rol_viejo.esActual=false
    @asignacion_rol_new = AsignacionRol.new
    @asignacion_rol_new.proyecto = @asignacion_rol_viejo.proyecto
    @asignacion_rol_new.rol_id = params[:asignacion_rol][:rol_id]
    @asignacion_rol_new.esActual=true
    @asignacion_rol_new.usuario=@asignacion_rol.usuario
    @asignacion_rol_new.save
    if unica(@asignacion_rol.usuario_id,@asignacion_rol.proyecto_id, @asignacion_rol.rol_id) == true
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
    else
	    respond_to do |format|

		    format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @asignacion_rol.proyecto.id
		             flash[:notice] = 'El usuario ya se encuentra asignado' } 
	    end
    end
  end

  # DELETE /asignacion_roles/1
  # DELETE /asignacion_roles/1.json
  def destroy
		authorize! :destroy, AsignacionRol
    @proyecto_id = @asignacion_rol.proyecto.id
    @asignacion_rol.save
    respond_to do |format|
      format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @proyecto_id
		    flash[:notice] = 'El usuario fue desasignado de su rol.' }
      format.json { head :no_content }
    end
  end

  def dar_baja 
		authorize! :dar_baja, AsignacionRol
    @asignacion_rol = AsignacionRol.find(params[:id])
    @asignacion_rol.esActual = false
    @asignacion_rol.save
    respond_to do |format|
      format.html { redirect_to :controller => 'asignacion_roles', :action => 'index', :proyecto_id => @asignacion_rol.proyecto.id, notice: 'El usuario fue desasignado de su rol.'
		     flash[:notice] = 'La asignación fue dada de baja satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def unica( usuario, proyecto, rol) 
	if AsignacionRol.all.where(usuario_id: usuario, proyecto_id: proyecto, rol_id: rol ,esActual: true ).count == 0
		p true
		true
	else
		p false
		false
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
