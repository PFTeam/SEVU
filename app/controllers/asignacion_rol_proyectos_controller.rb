class AsignacionRolProyectosController < ApplicationController
  before_action :set_asignacion_rol_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_rol_proyectos
  # GET /asignacion_rol_proyectos.json
  def index
    @asignacion_rol_proyectos = AsignacionRolProyecto.all
  end

  # GET /asignacion_rol_proyectos/1
  # GET /asignacion_rol_proyectos/1.json
  def show
  end

  # GET /asignacion_rol_proyectos/new
  def new
    @asignacion_rol_proyecto = AsignacionRolProyecto.new
  end

  # GET /asignacion_rol_proyectos/1/edit
  def edit
  end

  # POST /asignacion_rol_proyectos
  # POST /asignacion_rol_proyectos.json
  def create
    @asignacion_rol_proyecto = AsignacionRolProyecto.new(asignacion_rol_proyecto_params)

    respond_to do |format|
      if @asignacion_rol_proyecto.save
        format.html { redirect_to @asignacion_rol_proyecto, notice: 'Asignacion rol proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @asignacion_rol_proyecto }
      else
        format.html { render :new }
        format.json { render json: @asignacion_rol_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_rol_proyectos/1
  # PATCH/PUT /asignacion_rol_proyectos/1.json
  def update
    respond_to do |format|
      if @asignacion_rol_proyecto.update(asignacion_rol_proyecto_params)
        format.html { redirect_to @asignacion_rol_proyecto, notice: 'Asignacion rol proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignacion_rol_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_rol_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_rol_proyectos/1
  # DELETE /asignacion_rol_proyectos/1.json
  def destroy
    @asignacion_rol_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_rol_proyectos_url, notice: 'Asignacion rol proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_rol_proyecto
      @asignacion_rol_proyecto = AsignacionRolProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_rol_proyecto_params
      params.require(:asignacion_rol_proyecto).permit(:fechaCambioEstado, :esActual, :rol_id, :proyecto_id, :usuario_id)
    end
end
