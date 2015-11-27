class InformeGastosController < ApplicationController
  before_action :set_informe_gasto, only: [:show, :edit, :update, :destroy, :gestionar_informe_gastos]

  # GET /informe_gastos
  # GET /informe_gastos.json
  def index
		authorize! :index, InformeGasto
    @informe_gastos = InformeGasto.all
  end

  # GET /informe_gastos/1
  # GET /informe_gastos/1.json
  def show
		authorize! :show, InformeGasto
  end

  # GET /informe_gastos/new
  def new
		authorize! :new, InformeGasto
    @informe_gasto = InformeGasto.new
  end

  # GET /informe_gastos/1/edit
  def edit
		authorize! :edit, InformeGasto
  end

  # POST /informe_gastos
  # POST /informe_gastos.json
  def create
		authorize! :create, InformeGasto
    @informe_gasto = InformeGasto.new(informe_gasto_params)

    respond_to do |format|
      if @informe_gasto.save
        sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)

        Transaccion.create!(descripcion: "Creacion del informe de gasto del proyecto "+@informe_gasto.proyecto.nombre+ ': '+@informe_gasto.attributes,
                  sesion_id: sesion.id, 
                  proyecto_id: @informe_gasto.proyecto.id)

#         Transaccion.create!(
#           descripcion: "Creacion del informe de gasto del proyecto"+@informe_gasto.proyecto.nombre,
# ‪           sesion_id‬: sesion.id,
# ‪           proyecto_id‬: @informe_gasto.proyecto.id
#         )
        format.html { redirect_to gestionar_informe_gastos_path(@informe_gasto) }
        #format.html { redirect_to @informe_gasto, notice: 'Informe gasto fue creado satisfactoriamente.' }
        #format.json { render :show, status: :created, location: @informe_gasto }
      else
        format.html { render :back }
        #format.html { render :new }
        #format.json { render json: @informe_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_gastos/1
  # PATCH/PUT /informe_gastos/1.json
  def update
		authorize! :update, InformeGasto
    respond_to do |format|
      if @informe_gasto.update(informe_gasto_params)
        sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)

        Transaccion.create!(descripcion: "Modificacion del informe de gasto del proyecto "+@informe_gasto.proyecto.nombre+' : '+ @informe_gasto.previous_changes,
                  sesion_id: sesion.id, 
                  proyecto_id: @informe_gasto.proyecto.id)

#         Transaccion.create!(
#           descripcion: 'Modificacion del informe de gasto del proyecto'+@informe_gasto.proyecto.nombre,
# ‪           sesion_id‬: sesion.id
# ‪           proyecto_id‬: @informe_gasto.proyecto.id
#         )
        format.html { redirect_to gestionar_informe_gastos_path(@informe_gasto) }
        #format.html { redirect_to @informe_gasto, notice: 'Informe gasto fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @informe_gasto }
      else
         format.html { render :back }
       #format.html { render :edit }
        #format.json { render json: @informe_gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_gastos/1
  # DELETE /informe_gastos/1.json
  def destroy
		authorize! :destroy, InformeGasto
    sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)

        Transaccion.create!(descripcion: "Eliminacion del informe de gasto del proyecto "+@informe_gasto.proyecto.nombre+ ': '+@informe_gasto.attributes,
                  sesion_id: sesion.id, 
                  proyecto_id: @informe_gasto.proyecto.id)

#         Transaccion.create!(
#           descripcion: 'Destruccion del informe de gasto del proyecto'+@informe_gasto.proyecto.nombre,
# ‪           sesion_id‬: sesion.id
# ‪           proyecto_id‬: @informe_gasto.proyecto.id
#         )
    @informe_gasto.destroy
    respond_to do |format|
      format.html { redirect_to informe_gastos_url, notice: 'Informe gasto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
  
  def gestionar_informe_gastos

    puts "************************ "
		authorize! :gestionar_informe_gastos, InformeGasto
    #@detalles_gasto = DetalleGasto.where(informe_gasto_id: params[:id]).order(:monto).reverse_order
    #@detalles_gasto = @informe_gasto.detalle_gastos
    @proyecto = @informe_gasto.proyecto
    if @informe_gasto.detalle_gastos.nil? then
      @informe_gasto.montoTotal = 0
    else
      @informe_gasto.montoTotal = @informe_gasto.detalle_gastos.sum(:monto)
    end
    @conceptos_no_usados = ConceptoGasto.all - @informe_gasto.concepto_gastos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe_gasto
      @informe_gasto = InformeGasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def informe_gasto_params
      params.permit(:montoTotal, :proyecto_id)
    end
end
