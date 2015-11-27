class DetalleGastosController < ApplicationController
  before_action :set_informe_gasto, only: [:new, :create, :destroy]
  before_action :set_informe_gasto_detalle_gasto, only: [:show, :destroy]
  before_action :set_detalle_gasto, only: [:edit, :update]

  # GET /detalle_gastos
  # GET /detalle_gastos.json
  def index
		authorize! :index, DetalleGasto
    @detalle_gastos = DetalleGasto.all
  end

  # GET /detalle_gastos/1
  # GET /detalle_gastos/1.json
  def show
		authorize! :show, DetalleGasto
    @proyecto = @detalle_gasto.informe_gasto.proyecto
  end

  # GET /detalle_gastos/new
  def new
    authorize! :new, DetalleGasto
    #@detalle_gasto = DetalleGasto.new
    @detalle_gasto = @informe_gastos.detalle_gastos.new
    #@detalle_gasto.informe_gastos_id = @informe_gasto.id
    @concepto_gastos = ConceptoGasto.all
    @detalle_gasto.voluntario_id = current_usuario.id
    @proyecto = @detalle_gasto.informe_gasto.proyecto

  end

  # GET /detalle_gastos/1/edit
  def edit
		authorize! :edit, DetalleGasto
    @concepto_gastos = ConceptoGasto.all
    @proyecto = @detalle_gasto.informe_gasto.proyecto
    
  end

  # POST /detalle_gastos
  # POST /detalle_gastos.json
  def create
		authorize! :create, DetalleGasto
    @detalle_gasto = @informe_gastos.detalle_gastos.new(detalle_gasto_params)
    @detalle_gasto.voluntario_id = current_usuario.id
    respond_to do |format|
      if @detalle_gasto.save
        sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
        Transaccion.create!(descripcion: "Creación del detalle gasto #{@detalle_gasto.titulo}, descripcion: #{@detalle_gasto.descripcion}, con monto #{@detalle_gasto.monto}, concepto_gasto: #{@detalle_gasto.concepto_gasto.titulo}, voluntario: #{@detalle_gasto.voluntario.nombre}, comprobante: #{@detalle_gasto.comprobante.numero}",
                  sesion_id: sesion.id, 
                  proyecto_id: @detalle_gasto.informe_gasto.proyecto.id)
        #format.html { redirect_to gestionar_informe_gastos_path(@detalle_gasto.informe_gasto)} #@detalle_gasto, notice: 'Detalle gasto fue creado satisfactoriamente.' }
        format.html { redirect_to new_comprobante_path(:detalle_gasto_id => @detalle_gasto.id)}
        #format.json { render :show, status: :created, location: @detalle_gasto }
      else
        format.html { render :new }
        format.json { render json: @detalle_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_gastos/1
  # PATCH/PUT /detalle_gastos/1.json
  def update
		authorize! :update, DetalleGasto
    respond_to do |format|
      if @detalle_gasto.update(detalle_gasto_params)
        sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
        Transaccion.create!(descripcion: "Actualización del detalle gasto #{@detalle_gasto.titulo}, descripcion: #{@detalle_gasto.descripcion}, con monto #{@detalle_gasto.monto}, concepto_gasto: #{@detalle_gasto.concepto_gasto.titulo}, voluntario: #{@detalle_gasto.voluntario.nombre}, comprobante: #{@detalle_gasto.comprobante.numero}",
                  sesion_id: sesion.id, 
                  proyecto_id: @detalle_gasto.informe_gasto.proyecto.id)
        format.html { redirect_to gestionar_informe_gastos_path(@detalle_gasto.informe_gasto)} #@detalle_gasto, notice: 'Detalle gasto fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @detalle_gasto }
      else
        format.html { render :edit }
        format.json { render json: @detalle_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_gastos/1
  # DELETE /detalle_gastos/1.json
  def destroy
		authorize! :destroy, DetalleGasto
		sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
		Transaccion.create!(descripcion: "Eliminar detalle gasto #{@detalle_gasto.titulo}, descripcion: #{@detalle_gasto.descripcion}, con monto #{@detalle_gasto.monto}, concepto_gasto: #{@detalle_gasto.concepto_gasto.titulo}, voluntario: #{@detalle_gasto.voluntario.nombre}, comprobante: #{@detalle_gasto.comprobante.numero}",
                  sesion_id: sesion.id, 
                  proyecto_id: @detalle_gasto.informe_gasto.proyecto.id)
    @detalle_gasto.destroy
    
    respond_to do |format|
      format.html { redirect_to gestionar_informe_gastos_path(@informe_gastos)} #detalle_gastos_url, notice: 'Detalle gasto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_gasto
      @detalle_gasto = DetalleGasto.find(params[:id])
    end

    def set_informe_gasto_detalle_gasto
      @detalle_gasto = @informe_gastos.detalle_gastos.find params[:id]
    end

    def set_informe_gasto
      @informe_gastos = InformeGasto.find params[:informe_gasto_id]
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_gasto_params
      params.require(:detalle_gasto).permit(:titulo, :descripcion, :monto, :concepto_gasto_id, :informe_gastos_id, :voluntario_id, :comprobante_id)
    end
end
