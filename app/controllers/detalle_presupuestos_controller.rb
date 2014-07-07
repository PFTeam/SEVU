class DetallePresupuestosController < ApplicationController
  before_action :set_detalle_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /detalle_presupuestos
  # GET /detalle_presupuestos.json
  def index
    @detalle_presupuestos = DetallePresupuesto.all
  end

  # GET /detalle_presupuestos/1
  # GET /detalle_presupuestos/1.json
  def show
  end

  # GET /detalle_presupuestos/new
  def new
    @detalle_presupuesto = DetallePresupuesto.new
  end

  # GET /detalle_presupuestos/1/edit
  def edit
  end

  # POST /detalle_presupuestos
  # POST /detalle_presupuestos.json
  def create
    @detalle_presupuesto = DetallePresupuesto.new(detalle_presupuesto_params)

    respond_to do |format|
      if @detalle_presupuesto.save
        format.html { redirect_to @detalle_presupuesto, notice: 'Detalle presupuesto was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_presupuesto }
      else
        format.html { render :new }
        format.json { render json: @detalle_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_presupuestos/1
  # PATCH/PUT /detalle_presupuestos/1.json
  def update
    respond_to do |format|
      if @detalle_presupuesto.update(detalle_presupuesto_params)
        format.html { redirect_to @detalle_presupuesto, notice: 'Detalle presupuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @detalle_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_presupuestos/1
  # DELETE /detalle_presupuestos/1.json
  def destroy
    @detalle_presupuesto.destroy
    respond_to do |format|
      format.html { redirect_to detalle_presupuestos_url, notice: 'Detalle presupuesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_presupuesto
      @detalle_presupuesto = DetallePresupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_presupuesto_params
      params.require(:detalle_presupuesto).permit(:titulo, :descripcion, :monto, :presupuesto_id, :concepto_gasto_id)
    end
end
