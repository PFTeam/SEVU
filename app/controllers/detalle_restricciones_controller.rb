class DetalleRestriccionesController < ApplicationController
  before_action :set_restriccion, only: [:new, :create]
  #before_action :set_restriccion_detalle_restriccion, only:[:show, :edit, :update, :destroy]
 
  before_action :set_detalle_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /detalle_restricciones
  # GET /detalle_restricciones.json
  def index
		authorize! :index, DetalleRestriccion
    @detalle_restricciones = DetalleRestriccion.all
  end

  # GET /detalle_restricciones/1
  # GET /detalle_restricciones/1.json
  def show
		authorize! :show, DetalleRestriccion
  end

  # GET /detalle_restricciones/new
  def new
		authorize! :new, DetalleRestriccion
    @detalle_restriccion = DetalleRestriccion.new
    @concepto_gastos = ConceptoGasto.all
  end

  # GET /detalle_restricciones/1/edit
  def edit
		authorize! :edit, DetalleRestriccion
    @concepto_gastos = ConceptoGasto.all
  end

  # POST /detalle_restricciones
  # POST /detalle_restricciones.json
  def create
		authorize! :create, DetalleRestriccion
    @detalle_restriccion = @restriccion.detalle_restricciones.new(detalle_restriccion_params)
    @concepto_gastos = ConceptoGasto.all
    respond_to do |format|
      if @detalle_restriccion.save
        format.html { redirect_to gestionar_restricciones_path}
        #format.html { redirect_to @detalle_restriccion, notice: 'Detalle restriccion fue creado satisfactoriamente.' }
        #format.json { render :show, status: :created, location: @detalle_restriccion }
      else
        format.html { render :new }
        format.json { render json: @detalle_restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_restricciones/1
  # PATCH/PUT /detalle_restricciones/1.json
  def update
		authorize! :update, DetalleRestriccion
    respond_to do |format|
    @concepto_gastos = ConceptoGasto.all
      if @detalle_restriccion.update(detalle_restriccion_params)
        format.html { redirect_to gestionar_restricciones_path, notice: 'Actualizado correctamente'}
        #format.html { redirect_to @detalle_restriccion, notice: 'Detalle restriccion fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @detalle_restriccion }
      else
        format.html { redirect_to gestionar_restricciones_path, alert: 'No pueden guardarse'}
        #format.html { render :edit }
        #format.json { render json: @detalle_restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_restricciones/1
  # DELETE /detalle_restricciones/1.json
  def destroy
		authorize! :destroy, DetalleRestriccion
    @detalle_restriccion.destroy
    respond_to do |format|
      format.html { redirect_to gestionar_restricciones_path, notice: 'Actualizado correctamente'}
      #format.html { redirect_to detalle_restricciones_url, notice: 'Detalle restriccion fue borrado satisfactoriamente.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_restriccion
      @detalle_restriccion = DetalleRestriccion.find(params[:id])
    end

    def set_restriccion
      @restriccion = Restriccion.find params[:restriccion_id]
    end  

    def set_restriccion_detalle_restriccion
      @detalle_restriccion = @restriccion.detalle_restriccion.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_restriccion_params
      params.require(:detalle_restriccion).permit(:esActiva, :fechaDesde, :fechaHasta, :montoMax, :restriccion_id, :concepto_gasto_id)
    end
end
