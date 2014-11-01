class ComprobantesController < ApplicationController
  before_action :set_comprobant, only: [:show, :edit, :update, :destroy]
  before_action :set_detalle_gasto, only: [:new, :create]

  # GET /comprobantes
  # GET /comprobantes.json
  def index
		authorize! :index, Comprobante
    @comprobantes = Comprobante.all
  end

  # GET /comprobantes/1
  # GET /comprobantes/1.json
  def show
		authorize! :show, Comprobante
  end

  # GET /comprobantes/new
  def new
		authorize! :new, Comprobante
    @comprobant = Comprobante.new
    @detalle_gasto = DetalleGasto.find params[:detalle_gasto_id]
    #@comprobant.detalle_gasto_id = params[:detalle_gasto_id]# @detalle_gasto.id
  end

  # GET /comprobantes/1/edit
  def edit
		authorize! :edit, Comprobante
  end

  # POST /comprobantes
  # POST /comprobantes.json
  def create
		authorize! :create, Comprobante
    @comprobant = Comprobante.new(comprobant_params)
    @comprobant.detalle_gasto = @detalle_gasto
    respond_to do |format|
      if @comprobant.save
        format.html { redirect_to gestionar_informe_gastos_path(@comprobant.detalle_gasto.informe_gasto) }#@comprobant, notice: 'Comprobante 'fue creado satisfactoriamente'.' }
        format.json { render :show, status: :created, location: @comprobant }
      else
        format.html { render :new }
        format.json { render json: @comprobant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comprobantes/1
  # PATCH/PUT /comprobantes/1.json
  def update
		authorize! :update, Comprobante
    respond_to do |format|
      if @comprobant.update(comprobant_params)
        format.html { redirect_to @comprobant, notice: 'Comprobante 'fue actualizado satisfactoriamente'.' }
        format.json { render :show, status: :ok, location: @comprobant }
      else
        format.html { render :edit }
        format.json { render json: @comprobant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comprobantes/1
  # DELETE /comprobantes/1.json
  def destroy
		authorize! :destroy, Comprobante
    @comprobant.destroy
    respond_to do |format|
      format.html { redirect_to comprobantes_url, notice: 'Comprobante 'fue borrado satisfactoriamente'.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comprobant
      @comprobant = Comprobante.find(params[:id])
    end

    def set_detalle_gasto
      @detalle_gasto = DetalleGasto.find params[:detalle_gasto_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comprobant_params
      params.require(:comprobante).permit(:numero, :imagen, :detalle_gasto_id)
    end
end
