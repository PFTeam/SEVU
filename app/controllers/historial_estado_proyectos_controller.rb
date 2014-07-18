class HistorialEstadoProyectosController < ApplicationController
  before_action :set_historial_estado_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_proyectos
  # GET /historial_estado_proyectos.json
  def index
    @historial_estado_proyectos = HistorialEstadoProyecto.all
  end

  # GET /historial_estado_proyectos/1
  # GET /historial_estado_proyectos/1.json
  def show
  end

  # GET /historial_estado_proyectos/new
  def new
    @historial_estado_proyecto = HistorialEstadoProyecto.new
  end

  # GET /historial_estado_proyectos/1/edit
  def edit
  end

  # POST /historial_estado_proyectos
  # POST /historial_estado_proyectos.json
  def create
    @historial_estado_proyecto = HistorialEstadoProyecto.new(historial_estado_proyecto_params)

    respond_to do |format|
      if @historial_estado_proyecto.save
        format.html { redirect_to @historial_estado_proyecto, notice: 'Historial estado proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @historial_estado_proyecto }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_proyectos/1
  # PATCH/PUT /historial_estado_proyectos/1.json
  def update
    respond_to do |format|
      if @historial_estado_proyecto.update(historial_estado_proyecto_params)
        format.html { redirect_to @historial_estado_proyecto, notice: 'Historial estado proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_proyectos/1
  # DELETE /historial_estado_proyectos/1.json
  def destroy
    @historial_estado_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_proyectos_url, notice: 'Historial estado proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_proyecto
      @historial_estado_proyecto = HistorialEstadoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_proyecto_params
      params.require(:historial_estado_proyecto).permit(:fechaCambioEstado, :esActual, :estado_proyecto_id, :proyecto_id)
    end
end