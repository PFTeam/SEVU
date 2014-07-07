class ComprobantesController < ApplicationController
  before_action :set_comprobante, only: [:show, :edit, :update, :destroy]

  # GET /comprobantes
  # GET /comprobantes.json
  def index
    @comprobantes = Comprobante.all
  end

  # GET /comprobantes/1
  # GET /comprobantes/1.json
  def show
  end

  # GET /comprobantes/new
  def new
    @comprobante = Comprobante.new
  end

  # GET /comprobantes/1/edit
  def edit
  end

  # POST /comprobantes
  # POST /comprobantes.json
  def create
    @comprobante = Comprobante.new(comprobante_params)

    respond_to do |format|
      if @comprobante.save
        format.html { redirect_to @comprobante, notice: 'Comprobante was successfully created.' }
        format.json { render :show, status: :created, location: @comprobante }
      else
        format.html { render :new }
        format.json { render json: @comprobante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comprobantes/1
  # PATCH/PUT /comprobantes/1.json
  def update
    respond_to do |format|
      if @comprobante.update(comprobante_params)
        format.html { redirect_to @comprobante, notice: 'Comprobante was successfully updated.' }
        format.json { render :show, status: :ok, location: @comprobante }
      else
        format.html { render :edit }
        format.json { render json: @comprobante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comprobantes/1
  # DELETE /comprobantes/1.json
  def destroy
    @comprobante.destroy
    respond_to do |format|
      format.html { redirect_to comprobantes_url, notice: 'Comprobante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comprobante
      @comprobante = Comprobante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comprobante_params
      params.require(:comprobante).permit(:numero)
    end
end
