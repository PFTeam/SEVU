class DetalleGastosController < ApplicationController
  before_action :set_detalle_gasto, only: [:show, :edit, :update, :destroy]

  # GET /detalle_gastos
  # GET /detalle_gastos.json
  def index
    @detalle_gastos = DetalleGasto.all
  end

  # GET /detalle_gastos/1
  # GET /detalle_gastos/1.json
  def show
  end

  # GET /detalle_gastos/new
  def new
    @detalle_gasto = DetalleGasto.new
  end

  # GET /detalle_gastos/1/edit
  def edit
  end

  # POST /detalle_gastos
  # POST /detalle_gastos.json
  def create
    @detalle_gasto = DetalleGasto.new(detalle_gasto_params)

    respond_to do |format|
      if @detalle_gasto.save
        format.html { redirect_to @detalle_gasto, notice: 'Detalle gasto was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_gasto }
      else
        format.html { render :new }
        format.json { render json: @detalle_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_gastos/1
  # PATCH/PUT /detalle_gastos/1.json
  def update
    respond_to do |format|
      if @detalle_gasto.update(detalle_gasto_params)
        format.html { redirect_to @detalle_gasto, notice: 'Detalle gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_gasto }
      else
        format.html { render :edit }
        format.json { render json: @detalle_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_gastos/1
  # DELETE /detalle_gastos/1.json
  def destroy
    @detalle_gasto.destroy
    respond_to do |format|
      format.html { redirect_to detalle_gastos_url, notice: 'Detalle gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_gasto
      @detalle_gasto = DetalleGasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_gasto_params
      params.require(:detalle_gasto).permit(:titulo, :descripcion, :monto, :concepto_gasto_id, :informe_gastos_id, :voluntario_id, :comprobante_id)
    end
end