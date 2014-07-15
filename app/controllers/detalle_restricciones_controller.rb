class DetalleRestriccionesController < ApplicationController
  before_action :set_detalle_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /detalle_restricciones
  # GET /detalle_restricciones.json
  def index
    @detalle_restricciones = DetalleRestriccion.all
  end

  # GET /detalle_restricciones/1
  # GET /detalle_restricciones/1.json
  def show
  end

  # GET /detalle_restricciones/new
  def new
    @detalle_restriccion = DetalleRestriccion.new
  end

  # GET /detalle_restricciones/1/edit
  def edit
  end

  # POST /detalle_restricciones
  # POST /detalle_restricciones.json
  def create
    @detalle_restriccion = DetalleRestriccion.new(detalle_restriccion_params)

    respond_to do |format|
      if @detalle_restriccion.save
        format.html { redirect_to @detalle_restriccion, notice: 'Detalle restriccion was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_restriccion }
      else
        format.html { render :new }
        format.json { render json: @detalle_restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_restricciones/1
  # PATCH/PUT /detalle_restricciones/1.json
  def update
    respond_to do |format|
      if @detalle_restriccion.update(detalle_restriccion_params)
        format.html { redirect_to @detalle_restriccion, notice: 'Detalle restriccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_restriccion }
      else
        format.html { render :edit }
        format.json { render json: @detalle_restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_restricciones/1
  # DELETE /detalle_restricciones/1.json
  def destroy
    @detalle_restriccion.destroy
    respond_to do |format|
      format.html { redirect_to detalle_restricciones_url, notice: 'Detalle restriccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_restriccion
      @detalle_restriccion = DetalleRestriccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_restriccion_params
      params.require(:detalle_restriccion).permit(:esActiva, :fechaDesde, :fechaHasta, :montoMax, :restriccion_id, :concepto_gasto_id)
    end
end
