class DetallePresupuestosController < ApplicationController
 before_action :set_presupuesto, only: [:new, :create, :edit, :update, :destroy]
 before_action :set_presupuesto_detalle_presupuesto, only: [:show, :edit, :update, :destroy]
 #before_action :set_detalle_presupuesto, only: [:show]

 
  # GET /detalle_presupuestos
  # GET /detalle_presupuestos.json
  def index
    @detalle_presupuestos = DetallePresupuesto.all
  end

  # GET /detalle_presupuestos/1
  # GET /detalle_presupuestos/1.json
  def show
    @detalle_presupuestos = DetallePresupuesto.all
  end

  # GET /detalle_presupuestos/new
  def new
    @detalle_presupuesto = @presupuesto.detalle_presupuestos.new
    @concepto_gastos = ConceptoGasto.all
  end

  # GET /detalle_presupuestos/1/edit
  def edit
    @detalle_presupuesto = @presupuesto.detalle_presupuestos.new #@detalle_presupuesto = DetallePresupuesto.new
    @concepto_gastos = ConceptoGasto.all 
  end

  # POST /detalle_presupuestos
  # POST /detalle_presupuestos.json
  def create
   # @detalle_presupuesto = DetallePresupuesto.new(detalle_presupuesto_params)
    @detalle_presupuesto = @presupuesto.detalle_presupuestos.new(detalle_presupuesto_params)
    respond_to do |format|
      if @detalle_presupuesto.save
        format.html {redirect_to gestionar_presupuesto_path(@presupuesto)}
        #format.html { redirect_to [@presupuesto, @detalle_presupuesto], notice: 'Detalle creado correctamente.' }
        #format.html { redirect_to @detalle_presupuesto, notice: 'Detalle presupuesto was successfully created.' }
        #format.json { render :show, status: :created, location: @detalle_presupuesto }
      else
        format.html { render :new }
        format.json { render json: @detalle_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_presupuestos/1
  # PATCH/PUT /detalle_presupuestos/1.json
  def update
    respond_to do |format|
      if @detalle_presupuesto = @presupuesto.detalle_presupuestos.new# @detalle_presupuesto.update(detalle_presupuesto_params)
        format.html { redirect_to @detalle_presupuesto, notice: 'Detalle presupuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @detalle_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_presupuestos/1
  # DELETE /detalle_presupuestos/1.json
  def destroy
    @detalle_presupuesto.destroy
    respond_to do |format|
      format.html { redirect_to gestionar_presupuesto_path(@presupuesto), notice: 'Detalle eliminado correctamente '}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_presupuesto
      @detalle_presupuesto = DetallePresupuesto.find params[:id]
    end

    def set_presupuesto_detalle_presupuesto
      @detalle_presupuesto = @presupuesto.detalle_presupuestos.find(params[:id])
    end

    def set_presupuesto
      @presupuesto = Presupuesto.find params[:presupuesto_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_presupuesto_params
      params.require(:detalle_presupuesto).permit(:titulo, :descripcion, :monto, :presupuesto_id, :concepto_gasto_id)
    end
end
