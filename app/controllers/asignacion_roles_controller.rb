class AsignacionRolesController < ApplicationController
  before_action :set_asignacion_rol, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_roles
  # GET /asignacion_roles.json
  def index
    @asignacion_roles = AsignacionRol.all
  end

  # GET /asignacion_roles/1
  # GET /asignacion_roles/1.json
  def show
  end

  # GET /asignacion_roles/new
  def new
    @asignacion_rol = AsignacionRol.new
  end

  # GET /asignacion_roles/1/edit
  def edit
  end

  # POST /asignacion_roles
  # POST /asignacion_roles.json
  def create
    @asignacion_rol = AsignacionRol.new(asignacion_rol_params)

    respond_to do |format|
      if @asignacion_rol.save
        format.html { redirect_to @asignacion_rol, notice: 'Asignacion rol was successfully created.' }
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
    respond_to do |format|
      if @asignacion_rol.update(asignacion_rol_params)
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
    @asignacion_rol.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_roles_url, notice: 'Asignacion rol was successfully destroyed.' }
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
