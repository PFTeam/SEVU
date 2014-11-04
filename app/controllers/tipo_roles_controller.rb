class TipoRolesController < ApplicationController
  before_action :set_tipo_rol, only: [:show, :edit, :update, :destroy]

  # GET /tipo_roles
  # GET /tipo_roles.json
  def index
		authorize! :index, TipoRol
    @tipo_roles = TipoRol.all
  end

  # GET /tipo_roles/1
  # GET /tipo_roles/1.json
  def show
		authorize! :show, TipoRol
  end

  # GET /tipo_roles/new
  def new
		authorize! :new, TipoRol
    @tipo_rol = TipoRol.new
  end

  # GET /tipo_roles/1/edit
  def edit
		authorize! :edit, TipoRol

  end

  # POST /tipo_roles
  # POST /tipo_roles.json
  def create
		authorize! :create, TipoRol
    @tipo_rol = TipoRol.new(tipo_rol_params)
		
    respond_to do |format|
      if @tipo_rol.save
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Creacion del tipo de rol  '+@tipo_rol.nombre,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @tipo_rol, notice: 'Tipo rol fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @tipo_rol }
      else
        format.html { render :new }
        format.json { render json: @tipo_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_roles/1
  # PATCH/PUT /tipo_roles/1.json
  def update
		authorize! :update, TipoRol
    respond_to do |format|
			sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Actualización del tipo de rol  '+@tipo_rol.nombre,
    				sesion_id: sesion.id
				)
      if @tipo_rol.update(tipo_rol_params)
        format.html { redirect_to @tipo_rol, notice: 'Tipo rol fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @tipo_rol }
      else
        format.html { render :edit }
        format.json { render json: @tipo_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_roles/1
  # DELETE /tipo_roles/1.json
  def destroy
		authorize! :destroy, TipoRol
		sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Eliminar el tipo de rol  '+@tipo_rol.nombre,
    				sesion_id: sesion.id
				)
    @tipo_rol.destroy
    respond_to do |format|
      format.html { redirect_to tipo_roles_url, notice: 'Tipo rol fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_rol
      @tipo_rol = TipoRol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_rol_params
      params.require(:tipo_rol).permit(:nombre, :descripcion)
    end
end
