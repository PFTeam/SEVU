class ConceptoGastosController < ApplicationController
  before_action :set_concepto_gasto, only: [:show, :edit, :update, :destroy]

  # GET /concepto_gastos
  # GET /concepto_gastos.json
  def index
		authorize! :index, ConceptoGasto
    @concepto_gastos = ConceptoGasto.all
  end

  # GET /concepto_gastos/1
  # GET /concepto_gastos/1.json
  def show
		authorize! :show, ConceptoGasto
  end

  # GET /concepto_gastos/new
  def new
		authorize! :new, ConceptoGasto
    @concepto_gasto = ConceptoGasto.new
  end

  # GET /concepto_gastos/1/edit
  def edit
		authorize! :edit, ConceptoGasto
  end

  # POST /concepto_gastos
  # POST /concepto_gastos.json
  def create
		authorize! :create, ConceptoGasto
    @concepto_gasto = ConceptoGasto.new(concepto_gasto_params)

    respond_to do |format|
      if @concepto_gasto.save
        format.html { redirect_to gestionar_concepto_gastos_path }#  @concepto_gasto, notice: 'Concepto gasto fue creado satisfactoriamente.' }
        #format.json { render :show, status: :created, location: @concepto_gasto }
      else
        format.html { render :new }
        format.json { render json: @concepto_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepto_gastos/1
  # PATCH/PUT /concepto_gastos/1.json
  def update
		authorize! :update, ConceptoGasto
    respond_to do |format|
      if @concepto_gasto.update(concepto_gasto_params)
        format.html { redirect_to gestionar_concepto_gastos_path }# @concepto_gasto, notice: 'Concepto gasto fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @concepto_gasto }
      else
        format.html { render :edit }
        format.json { render json: @concepto_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepto_gastos/1
  # DELETE /concepto_gastos/1.json
  def destroy
		authorize! :destroy, ConceptoGasto
    #@concepto_gasto.destroy
    respond_to do |format|
      if @concepto_gasto.destroy
      format.html { redirect_to gestionar_concepto_gastos_path }# concepto_gastos_url, notice: 'Concepto gasto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
      else
       format.html { redirect_to :back, alert: 'El concepto de gasto no puede ser eliminado porque es actualmente utilizado'} 
      end
    end
  end

    def gestionar_concepto_gastos
			authorize! :gestionar_concepto_gastos, ConceptoGasto
      @conceptos = ConceptoGasto.all
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
