class TipoTransaccionesController < ApplicationController
  before_action :set_tipo_transaccion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_transacciones
  # GET /tipo_transacciones.json
  def index
    @tipo_transacciones = TipoTransaccion.all
  end

  # GET /tipo_transacciones/1
  # GET /tipo_transacciones/1.json
  def show
  end

  # GET /tipo_transacciones/new
  def new
    @tipo_transaccion = TipoTransaccion.new
  end

  # GET /tipo_transacciones/1/edit
  def edit
  end

  # POST /tipo_transacciones
  # POST /tipo_transacciones.json
  def create
    @tipo_transaccion = TipoTransaccion.new(tipo_transaccion_params)

    respond_to do |format|
      if @tipo_transaccion.save
        format.html { redirect_to @tipo_transaccion, notice: 'Tipo transaccion was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_transaccion }
      else
        format.html { render :new }
        format.json { render json: @tipo_transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_transacciones/1
  # PATCH/PUT /tipo_transacciones/1.json
  def update
    respond_to do |format|
      if @tipo_transaccion.update(tipo_transaccion_params)
        format.html { redirect_to @tipo_transaccion, notice: 'Tipo transaccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_transaccion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_transacciones/1
  # DELETE /tipo_transacciones/1.json
  def destroy
    @tipo_transaccion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_transacciones_url, notice: 'Tipo transaccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_transaccion
      @tipo_transaccion = TipoTransaccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_transaccion_params
      params.require(:tipo_transaccion).permit(:descripcion)
    end
end