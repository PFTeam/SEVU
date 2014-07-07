class AsignacionRolSistemasController < ApplicationController
  before_action :set_asignacion_rol_sistema, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_rol_sistemas
  # GET /asignacion_rol_sistemas.json
  def index
    @asignacion_rol_sistemas = AsignacionRolSistema.all
  end

  # GET /asignacion_rol_sistemas/1
  # GET /asignacion_rol_sistemas/1.json
  def show
  end

  # GET /asignacion_rol_sistemas/new
  def new
    @asignacion_rol_sistema = AsignacionRolSistema.new
  end

  # GET /asignacion_rol_sistemas/1/edit
  def edit
  end

  # POST /asignacion_rol_sistemas
  # POST /asignacion_rol_sistemas.json
  def create
    @asignacion_rol_sistema = AsignacionRolSistema.new(asignacion_rol_sistema_params)

    respond_to do |format|
      if @asignacion_rol_sistema.save
        format.html { redirect_to @asignacion_rol_sistema, notice: 'Asignacion rol sistema was successfully created.' }
        format.json { render :show, status: :created, location: @asignacion_rol_sistema }
      else
        format.html { render :new }
        format.json { render json: @asignacion_rol_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_rol_sistemas/1
  # PATCH/PUT /asignacion_rol_sistemas/1.json
  def update
    respond_to do |format|
      if @asignacion_rol_sistema.update(asignacion_rol_sistema_params)
        format.html { redirect_to @asignacion_rol_sistema, notice: 'Asignacion rol sistema was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignacion_rol_sistema }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_rol_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_rol_sistemas/1
  # DELETE /asignacion_rol_sistemas/1.json
  def destroy
    @asignacion_rol_sistema.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_rol_sistemas_url, notice: 'Asignacion rol sistema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_rol_sistema
      @asignacion_rol_sistema = AsignacionRolSistema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_rol_sistema_params
      params.require(:asignacion_rol_sistema).permit(:fechaAsignacion, :esActual, :descripcion, :usuario_id, :rol_id)
    end
end
