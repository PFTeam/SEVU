class InformeGastosController < ApplicationController
  before_action :set_informe_gasto, only: [:show, :edit, :update, :destroy]

  # GET /informe_gastos
  # GET /informe_gastos.json
  def index
    @informe_gastos = InformeGasto.all
  end

  # GET /informe_gastos/1
  # GET /informe_gastos/1.json
  def show
  end

  # GET /informe_gastos/new
  def new
    @informe_gasto = InformeGasto.new
  end

  # GET /informe_gastos/1/edit
  def edit
  end

  # POST /informe_gastos
  # POST /informe_gastos.json
  def create
    @informe_gasto = InformeGasto.new(informe_gasto_params)

    respond_to do |format|
      if @informe_gasto.save
        format.html { redirect_to @informe_gasto, notice: 'Informe gasto was successfully created.' }
        format.json { render :show, status: :created, location: @informe_gasto }
      else
        format.html { render :new }
        format.json { render json: @informe_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_gastos/1
  # PATCH/PUT /informe_gastos/1.json
  def update
    respond_to do |format|
      if @informe_gasto.update(informe_gasto_params)
        format.html { redirect_to @informe_gasto, notice: 'Informe gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @informe_gasto }
      else
        format.html { render :edit }
        format.json { render json: @informe_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_gastos/1
  # DELETE /informe_gastos/1.json
  def destroy
    @informe_gasto.destroy
    respond_to do |format|
      format.html { redirect_to informe_gastos_url, notice: 'Informe gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe_gasto
      @informe_gasto = InformeGasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def informe_gasto_params
      params.require(:informe_gasto).permit(:montoTotal, :proyecto_id)
    end
end
