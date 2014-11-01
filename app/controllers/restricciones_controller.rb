class RestriccionesController < ApplicationController
  before_action :set_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /restricciones
  # GET /restricciones.json
  def index
		authorize! :index, Restriccion
    @restricciones = Restriccion.all
  end

  # GET /restricciones/1
  # GET /restricciones/1.json
  def show
		authorize! :show, Restriccion
  end

  # GET /restricciones/new
  def new
		authorize! :new, Restriccion
    @restriccion = Restriccion.new
    @concepto_gastos = ConceptoGasto.all
  end

  # GET /restricciones/1/edit
  def edit
		authorize! :edit, Restriccion
     @concepto_gastos = ConceptoGasto.all
  end

  # POST /restricciones
  # POST /restricciones.json
  def create
		authorize! :create, Restriccion
    @restriccion = Restriccion.new(restriccion_params)
    @concepto_gastos = ConceptoGasto.all
    respond_to do |format|
      if @restriccion.save
        format.html {redirect_to gestionar_restricciones_path}
        #format.html { redirect_to @restriccion, notice: 'Restriccion 'fue creado satisfactoriamente'.' }
        format.json { render :show, status: :created, location: @restriccion }
      else
        format.html { render :new }
        format.json { render json: @restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restricciones/1
  # PATCH/PUT /restricciones/1.json
  def update
		authorize! :update, Restriccion
    @concepto_gastos = ConceptoGasto.all
    respond_to do |format|
      if @restriccion.update(restriccion_params)
        format.html { redirect_to gestionar_restricciones_path }#@restriccion, notice: 'Restriccion 'fue actualizado satisfactoriamente'.' }
        #format.json { render :show, status: :ok, location: @restriccion }
      else
        format.html { render :edit }
        format.json { render json: @restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restricciones/1
  # DELETE /restricciones/1.json
  def destroy
		authorize! :destroy, Restriccion
    @restriccion.destroy
    respond_to do |format|
      format.html { redirect_to restricciones_url, notice: 'Restriccion 'fue borrado satisfactoriamente'.' }
      format.json { head :no_content }
    end
  end

  def gestionar_restricciones
		authorize! :gestionar_restricciones, Restriccion
    @restricciones = Restriccion.all #find(params[:id]) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restriccion
      @restriccion = Restriccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restriccion_params
      params.require(:restriccion).permit(:concepto_gasto_id, :montoMax, :esActiva)
    end
end
