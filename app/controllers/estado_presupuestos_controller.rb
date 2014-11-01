class EstadoPresupuestosController < ApplicationController
  before_action :set_estado_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /estado_presupuestos
  # GET /estado_presupuestos.json
  def index
		authorize! :index, EstadoPresupuesto
    @estado_presupuestos = EstadoPresupuesto.all
  end

  # GET /estado_presupuestos/1
  # GET /estado_presupuestos/1.json
  def show
		authorize! :show, EstadoPresupuesto
  end

  # GET /estado_presupuestos/new
  def new
		authorize! :new, EstadoPresupuesto
    @estado_presupuesto = EstadoPresupuesto.new
  end

  # GET /estado_presupuestos/1/edit
  def edit
		authorize! :edit, EstadoPresupuesto
  end

  # POST /estado_presupuestos
  # POST /estado_presupuestos.json
  def create
		authorize! :create, EstadoPresupuesto
    @estado_presupuesto = EstadoPresupuesto.new(estado_presupuesto_params)

    respond_to do |format|
      if @estado_presupuesto.save
        format.html { redirect_to gestionar_estados_presupuestos_path}#@estado_presupuesto, notice: 'Estado presupuesto fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @estado_presupuesto }
      else
        format.html { render :new }
        format.json { render json: @estado_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_presupuestos/1
  # PATCH/PUT /estado_presupuestos/1.json
  def update
		authorize! :update, EstadoPresupuesto
    respond_to do |format|
      if @estado_presupuesto.update(estado_presupuesto_params)
        format.html { redirect_to gestionar_estados_presupuestos_path}#@estado_presupuesto, notice: 'Estado presupuesto fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @estado_presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @estado_presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_presupuestos/1
  # DELETE /estado_presupuestos/1.json
  def destroy
		authorize! :destroy, EstadoPresupuesto
    #@estado_presupuesto.destroy
    #respond_to do |format|
    #  format.html { redirect_to estado_presupuestos_url, notice: 'Estado presupuesto fue borrado satisfactoriamente.' }
    #  format.json { head :no_content }
    #end
    respond_to do |format|
      if @estado_presupuesto.destroy
      format.html { redirect_to gestionar_estados_presupuestos_path }# concepto_gastos_url, notice: 'Concepto gasto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
      else
       format.html { redirect_to :back, alert: 'El estado no puede ser eliminado porque es actualmente utilizado'} 
      end
    end

  end

  def gestionar_estados_presupuestos
		authorize! :gestionar_estados_presupuestos, EstadoPresupuesto
    @estados = EstadoPresupuesto.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_presupuesto
      @estado_presupuesto = EstadoPresupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_presupuesto_params
      params.require(:estado_presupuesto).permit(:nombre, :descripcion)
    end
end
