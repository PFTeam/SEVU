class PresupuestosController < ApplicationController
  before_action :set_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /presupuestos
  # GET /presupuestos.json
  def index
    @presupuestos = Presupuesto.all
  end

  # GET /presupuestos/1
  # GET /presupuestos/1.json
  def show
  end

  # GET /presupuestos/new
  def new
    @presupuesto = Presupuesto.new
  end

  # GET /presupuestos/1/edit
  def edit
  end

  # POST /presupuestos
  # POST /presupuestos.json
  def create
    @presupuesto = Presupuesto.new(presupuesto_params)

    respond_to do |format|
      if @presupuesto.save
        format.html { redirect_to gestionar_presupuesto_path(@presupuesto) }#, notice: 'El Presupuesto fue creado exitosamente.' }
        #format.json { render :show, status: :created, location: @presupuesto }
      else
        format.html { redirect_to proyectos_mis_proyectos_path }
                      #render :new }
        #format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presupuestos/1
  # PATCH/PUT /presupuestos/1.json
  def update
    respond_to do |format|
      if @presupuesto.update(presupuesto_params)
        format.html { redirect_to @presupuesto, notice: 'El Presupuesto fue creado exitosamente.' }
        format.json { render :show, status: :ok, location: @presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presupuestos/1
  # DELETE /presupuestos/1.json
  def destroy
    @presupuesto.destroy
    respond_to do |format|
      format.html { redirect_to presupuestos_url, notice: 'Presupuesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gestionar_presupuesto
    @presupuesto = Presupuesto.find(params[:id])
    @detalles_presupuesto = DetallePresupuesto.where(presupuesto_id: params[:id]).order(:monto).reverse_order
    @presupuesto.montoTotal = @detalles_presupuesto.sum(:monto)
    @conceptos = @presupuesto.concepto_gastos
    @conceptos_no_usados = ConceptoGasto.all - @conceptos

    #ConceptoGasto.all.each do |concept|                   #
    #  flag = 0                                            #
    #  @detalles_presupuesto.each do |det|                 #
    #    if det.concepto_gasto == concept then             #
    #      @conceptos = @conceptos.to_a.push concept       #  
    #      flag = 1                                        #
    #    end                                               #
    #  end                                                 # Esto es para traer los conceptos que son usados solamente
    #  if flag == 0 then                                   #
    #    @conceptos_no_usados = @conceptos_no_usados.to_a.push concept
    #  end                                                 #
    # end                                                  #
    #if !@conceptos.nil? then                              #el metodo uniq solo deja las instancias unicas, saca las
    #  @conceptos = @conceptos.uniq                        #repetidas dentro del arreglo
    #end                                                   #
    #if !@conceptos_no_usados.nil? then                    #
    #  @conceptos_no_usados = @conceptos_no_usados.uniq    #
    #end                                                   #

    #@conceptos = ConceptoGasto.all                 # Esto era para buscar todos los conceptos
  end

  def evaluar_presupuestos_pendientes
    @presupuestos = Presupuesto.all.select { |m| m.aprobado == false }
  end

  def evaluar_presupuesto
    @presupuesto = Presupuesto.find params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presupuesto
      @presupuesto = Presupuesto.find(params[:id])
    end
    
    def get_proyecto
      return self.proyecto_id
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def presupuesto_params
      params.permit(:fechaPresentacion, :montoTotal, :aprobado, :proyecto_id, :restriccion_id, :usuario_id)
    end
end
