class HistorialEstadoActividadsController < ApplicationController
  before_action :set_historial_estado_actividad, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_actividads
  # GET /historial_estado_actividads.json
  def index
    @historial_estado_actividads = HistorialEstadoActividad.all
  end

  # GET /historial_estado_actividads/1
  # GET /historial_estado_actividads/1.json
  def show
  end

  # GET /historial_estado_actividads/new
  def new
    @historial_estado_actividad = HistorialEstadoActividad.new
  end

  # GET /historial_estado_actividads/1/edit
  def edit
  end

  # POST /historial_estado_actividads
  # POST /historial_estado_actividads.json
  def create
    @historial_estado_actividad = HistorialEstadoActividad.new(historial_estado_actividad_params)

    respond_to do |format|
      if @historial_estado_actividad.save
        format.html { redirect_to @historial_estado_actividad, notice: 'Historial estado actividad was successfully created.' }
        format.json { render :show, status: :created, location: @historial_estado_actividad }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_actividads/1
  # PATCH/PUT /historial_estado_actividads/1.json
  def update
    respond_to do |format|
      if @historial_estado_actividad.update(historial_estado_actividad_params)
        format.html { redirect_to @historial_estado_actividad, notice: 'Historial estado actividad was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_actividad }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_actividads/1
  # DELETE /historial_estado_actividads/1.json
  def destroy
    @historial_estado_actividad.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_actividads_url, notice: 'Historial estado actividad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_actividad
      @historial_estado_actividad = HistorialEstadoActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_actividad_params
      params.require(:historial_estado_actividad).permit(:fechaCambioEstado, :esActual, :actividad_id, :estado_actividad_id)
    end
end
