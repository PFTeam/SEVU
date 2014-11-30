class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
		authorize! :index, Rol
    @roles = Rol.all
		@tipo_roles = []
			@roles.each do |rol| 
				@tipo_roles << TipoRol.find(rol.tipo_rol_id).nombre
			end
		@rol_id = params[:rol_id].to_i
		if @rol_id != 0
			@rol = Rol.find(@rol_id)
			@arp = []
			AsignacionRolPredefinido.all.each do |asignacionrolpredefinido|
				if Rol.find(asignacionrolpredefinido.rol).id == @rol_id
					privilegio = Privilegio.find(asignacionrolpredefinido.privilegio)
					@arp << {
        nombre: privilegio.nombre,
        descripcion: privilegio.descripcion,
				actual: asignacionrolpredefinido.esActual,
				id: asignacionrolpredefinido.id
      		}

				end
			end
		end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
		authorize! :show, Rol
  end

  # GET /roles/new
  def new
		authorize! :new, Rol
    @rol = Rol.new
  end

  # GET /roles/1/edit
  def edit
		authorize! :edit, Rol

  end

  # POST /roles
  # POST /roles.json
  def create
		authorize! :create, Rol
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Creación del rol  '+@rol.nombre,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @rol, notice: 'El rol se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
		authorize! :update, Rol
    respond_to do |format|
      if @rol.update(rol_params)
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Actualización del rol  '+@rol.nombre,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @rol, notice: 'Rol fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
		authorize! :destroy, Rol
		sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Eliminar el rol  '+@rol.nombre,
    				sesion_id: sesion.id
				)
    @rol.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Rol fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

	def configuraciones_generales
		authorize! :configuraciones_generales, Rol
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_params
      params.require(:rol).permit(:nombre, :descripcion, :tipo_rol_id)
    end
end
