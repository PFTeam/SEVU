class HistorialestadoProyectosController < ApplicationController
  before_action :set_historialestado_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /historialestado_proyectos
  # GET /historialestado_proyectos.json
  def index
    @historialestado_proyectos = HistorialestadoProyecto.all
  end

  # GET /historialestado_proyectos/1
  # GET /historialestado_proyectos/1.json
  def show
  end

  # GET /historialestado_proyectos/new
  def new
    @historialestado_proyecto = HistorialestadoProyecto.new
  end

  # GET /historialestado_proyectos/1/edit
  def edit
  end

  # POST /historialestado_proyectos
  # POST /historialestado_proyectos.json
  def create
    @historialestado_proyecto = HistorialestadoProyecto.new(historialestado_proyecto_params)

    respond_to do |format|
      if @historialestado_proyecto.save
        format.html { redirect_to @historialestado_proyecto, notice: 'Historialestado proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @historialestado_proyecto }
      else
        format.html { render :new }
        format.json { render json: @historialestado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historialestado_proyectos/1
  # PATCH/PUT /historialestado_proyectos/1.json
  def update
    respond_to do |format|
      if @historialestado_proyecto.update(historialestado_proyecto_params)
        format.html { redirect_to @historialestado_proyecto, notice: 'Historialestado proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @historialestado_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @historialestado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historialestado_proyectos/1
  # DELETE /historialestado_proyectos/1.json
  def destroy
    @historialestado_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to historialestado_proyectos_url, notice: 'Historialestado proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historialestado_proyecto
      @historialestado_proyecto = HistorialestadoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historialestado_proyecto_params
      params.require(:historialestado_proyecto).permit(:fechaCambioEstado, :esActual, :estado_proyecto_id, :proyecto_id)
    end
end
