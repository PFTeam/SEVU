class TransaccionsController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]

  # GET /transaccions
  # GET /transaccions.json
  def index
    @transaccions = Transaccion.all
  end

  # GET /transaccions/1
  # GET /transaccions/1.json
  def show
  end

  # GET /transaccions/new
  def new
    @transaccion = Transaccion.new
  end

  # GET /transaccions/1/edit
  def edit
  end

  # POST /transaccions
  # POST /transaccions.json
  def create
    @transaccion = Transaccion.new(transaccion_params)

    respond_to do |format|
      if @transaccion.save
        format.html { redirect_to @transaccion, notice: 'Transaccion was successfully created.' }
        format.json { render :show, status: :created, location: @transaccion }
      else
        format.html { render :new }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaccions/1
  # PATCH/PUT /transaccions/1.json
  def update
    respond_to do |format|
      if @transaccion.update(transaccion_params)
        format.html { redirect_to @transaccion, notice: 'Transaccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaccion }
      else
        format.html { render :edit }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaccions/1
  # DELETE /transaccions/1.json
  def destroy
    @transaccion.destroy
    respond_to do |format|
      format.html { redirect_to transaccions_url, notice: 'Transaccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaccion
      @transaccion = Transaccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaccion_params
      params.require(:transaccion).permit(:descripcion, :fechaTransaccion, :proyecto_id, :tipo_transaccion_id, :sesion_id)
    end
end
