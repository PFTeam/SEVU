class PresupuestosController < ApplicationController
  before_action :set_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /presupuestos
  # GET /presupuestos.json
  def index
		authorize! :index, Presupuesto
    @presupuestos = Presupuesto.all
  end

  # GET /presupuestos/1
  # GET /presupuestos/1.json
  def show
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :show).include?(@presupuesto) 
  end

  # GET /presupuestos/new
  def new
		authorize! :new, Presupuesto
    @presupuesto = Presupuesto.new
  end

  # GET /presupuestos/1/edit
  def edit
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :edit).include?(@presupuesto) 
  end

  # POST /presupuestos
  # POST /presupuestos.json
  def create
		authorize! :create, Presupuesto
    @presupuesto = Presupuesto.new(presupuesto_params)

    respond_to do |format|
      if @presupuesto.save
         sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)

        Transaccion.create!(descripcion: "Creación del presupuesto del proyecto #{@presupuesto.proyecto.nombre}: #{@presupuesto.attributes}",
                  sesion_id: sesion.id, 
                  proyecto_id: @presupuesto.proyecto.id)


#         Transaccion.create!(
#           descripcion: 'Creacion del presupuesto del proyecto'+@presupuesto.proyecto.nombre,
# ‪           sesion_id‬: sesion.id,
# ‪           proyecto_id‬: @presupuesto.proyecto.id
#         )
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
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :update).include?(@presupuesto) 
    respond_to do |format|
      if @presupuesto.update(presupuesto_params)
        sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
        if @presupuesto.evaluado then #el presupuesto fue evaluado
          if @presupuesto.aprobado then #el presupuesto fue aprobado
            description = "El presupuesto del proyecto #{@presupuesto.proyecto.nombre} fue Aprobado."
          else
            description = "El presupuesto del proyecto #{@presupuesto.proyecto.nombre} fue Rechazado."
          end
        else
          description = "El presupuesto del proyecto #{@presupuesto.proyecto.nombre} fue puesto para evaluar nuevamente."
        end
        # Creacion de la transaccion con mensaje personalizado
        Transaccion.create!(descripcion: description,
                  sesion_id: sesion.id, 
                  proyecto_id: @presupuesto.proyecto.id)

        format.html { redirect_to evaluar_presupuestos_pendientes_path }#@presupuesto, notice: 'El Presupuesto fue creado exitosamente.' }
        #format.json { render :show, status: :ok, location: @presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
      #if @presupuesto.update_attributes presupuesto_params#:aprobado #presupuesto_params #params[:presupuesto]
        #format.html { redirect_to :back }#evaluar_presupuestos_pendientes_path }
      #end
    end
  end

  # DELETE /presupuestos/1
  # DELETE /presupuestos/1.json
  def destroy
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :destroy).include?(@presupuesto) 
         sesion = Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				 Transaccion.create!(
          descripcion: "Eliminar el presupuesto del proyecto #{@presupuesto.proyecto.nombre}: #{@presupuesto.attributes}",
          sesion_id: sesion.id, 
          proyecto_id: @presupuesto.proyecto.id)
    @presupuesto.destroy
    respond_to do |format|
     
      format.html { redirect_to presupuestos_url, notice: 'Presupuesto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def gestionar_presupuesto
    @presupuesto = Presupuesto.find(params[:id])
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :gestionar_presupuesto).include?(@presupuesto) 
    @detalles_presupuesto = DetallePresupuesto.where(presupuesto_id: params[:id]).order(:monto).reverse_order
    @presupuesto.montoTotal = @detalles_presupuesto.sum(:monto)
    @conceptos = @presupuesto.concepto_gastos.uniq
    @conceptos_no_usados = ConceptoGasto.all - @conceptos
    @proyecto = @presupuesto.proyecto

  end

  def evaluar_presupuestos_pendientes
		authorize! :evaluar_presupuestos_pendientes, Presupuesto
    @presupuestos = Presupuesto.all.select { |m| m.evaluado == false }
    @presupuestos.each do |presupuesto|
        presupuesto.montoTotal = presupuesto.detalle_presupuestos.sum(:monto)
    end
  end

  def presupuestos_evaluados
		authorize! :presupuestos_evaluados, Presupuesto
    @presupuestos = Presupuesto.all.select { |m| m.evaluado == true }
    @presupuestos.each do |presupuesto|
        presupuesto.montoTotal = presupuesto.detalle_presupuestos.sum(:monto)
    end
  end

  def evaluar_presupuesto
    @presupuesto = Presupuesto.find params[:id]
		raise CanCan::AccessDenied if !Presupuesto.accessible_by(current_ability, :evaluar_presupuesto).include?(@presupuesto) 
    @presupuesto.montoTotal = @presupuesto.detalle_presupuestos.sum(:monto)
    @proyecto = @presupuesto.proyecto
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
      params.permit(:fechaPresentacion, :montoTotal, :aprobado, :proyecto_id, :restriccion_id, :usuario_id, :evaluado)
    end
end
