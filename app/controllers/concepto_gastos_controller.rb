class ConceptoGastosController < ApplicationController
  before_action :set_concepto_gasto, only: [:show, :edit, :update, :destroy]

  # GET /concepto_gastos
  # GET /concepto_gastos.json
  def index
    @concepto_gastos = ConceptoGasto.all
  end

  # GET /concepto_gastos/1
  # GET /concepto_gastos/1.json
  def show
  end

  # GET /concepto_gastos/new
  def new
    @concepto_gasto = ConceptoGasto.new
  end

  # GET /concepto_gastos/1/edit
  def edit
  end

  # POST /concepto_gastos
  # POST /concepto_gastos.json
  def create
    @concepto_gasto = ConceptoGasto.new(concepto_gasto_params)

    respond_to do |format|
      if @concepto_gasto.save
        format.html { redirect_to @concepto_gasto, notice: 'Concepto gasto was successfully created.' }
        format.json { render :show, status: :created, location: @concepto_gasto }
      else
        format.html { render :new }
        format.json { render json: @concepto_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepto_gastos/1
  # PATCH/PUT /concepto_gastos/1.json
  def update
    respond_to do |format|
      if @concepto_gasto.update(concepto_gasto_params)
        format.html { redirect_to @concepto_gasto, notice: 'Concepto gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @concepto_gasto }
      else
        format.html { render :edit }
        format.json { render json: @concepto_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepto_gastos/1
  # DELETE /concepto_gastos/1.json
  def destroy
    @concepto_gasto.destroy
    respond_to do |format|
      format.html { redirect_to concepto_gastos_url, notice: 'Concepto gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concepto_gasto
      @concepto_gasto = ConceptoGasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concepto_gasto_params
      params.require(:concepto_gasto).permit(:titulo, :descripcion)
    end
end