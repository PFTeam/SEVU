class HistorialEstadoPresupuestosController < ApplicationController
  before_action :set_historial_estado_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_presupuestos
  # GET /historial_estado_presupuestos.json
  def index
		authorize! :index, HistorialEstadoPresupuesto
    @historial_estado_presupuestos = HistorialEstadoPresupuesto.all
  end

  # GET /historial_estado_presupuestos/1
  # GET /historial_estado_presupuestos/1.json
  def show
		authorize! :show, HistorialEstadoPresupuesto
  end

  # GET /historial_estado_presupuestos/new
  def new
		authorize! :new, HistorialEstadoPresupuesto
    @historial_estado_presupuesto = HistorialEstadoPresupuesto.new
  end

  # GET /historial_estado_presupuestos/1/edit
  def edit
		authorize! :edit, HistorialEstadoPresupuesto
  end

  # POST /historial_estado_presupuestos
  # POST /historial_estado_presupuestos.json
  def create
		authorize! :create, HistorialEstadoPresupuesto
    @historial_estado_presupuesto = HistorialEstadoPresupuesto.new(historial_estado_presupuesto_params)

    respond_to do |format|
      if @historial_estado_presupuesto.save
        format.html { redirect_to @historial_estado_presupuesto, notice: 'Historial estado presupuesto was successfully created.' }
        format.json { render :show, status: :created, location: @historial_estado_presupuesto }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_presupuestos/1
  # PATCH/PUT /historial_estado_presupuestos/1.json
  def update
		authorize! :update, HistorialEstadoPresupuesto
    respond_to do |format|
      if @historial_estado_presupuesto.update(historial_estado_presupuesto_params)
        format.html { redirect_to @historial_estado_presupuesto, notice: 'Historial estado presupuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_presupuestos/1
  # DELETE /historial_estado_presupuestos/1.json
  def destroy
		authorize! :destroy, HistorialEstadoPresupuesto
    @historial_estado_presupuesto.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_presupuestos_url, notice: 'Historial estado presupuesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_presupuesto
      @historial_estado_presupuesto = HistorialEstadoPresupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_presupuesto_params
      params.require(:historial_estado_presupuesto).permit(:esActual, :fechaCambioEstado, :presupuesto_id, :estado_presupuesto_id)
    end
end
