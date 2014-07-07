class DetalleRestriccionsController < ApplicationController
  before_action :set_detalle_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /detalle_restriccions
  # GET /detalle_restriccions.json
  def index
    @detalle_restriccions = DetalleRestriccion.all
  end

  # GET /detalle_restriccions/1
  # GET /detalle_restriccions/1.json
  def show
  end

  # GET /detalle_restriccions/new
  def new
    @detalle_restriccion = DetalleRestriccion.new
  end

  # GET /detalle_restriccions/1/edit
  def edit
  end

  # POST /detalle_restriccions
  # POST /detalle_restriccions.json
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

  # PATCH/PUT /detalle_restriccions/1
  # PATCH/PUT /detalle_restriccions/1.json
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

  # DELETE /detalle_restriccions/1
  # DELETE /detalle_restriccions/1.json
  def destroy
    @detalle_restriccion.destroy
    respond_to do |format|
      format.html { redirect_to detalle_restriccions_url, notice: 'Detalle restriccion was successfully destroyed.' }
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
