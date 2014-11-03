class TransaccionesController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]

  # GET /transacciones
  # GET /transacciones.json
  def index
		authorize! :index, Transaccion #Para cancan
    @transacciones = Transaccion.all
  end

  # GET /transacciones/1
  # GET /transacciones/1.json
  def show
		authorize! :show, Transaccion
  end

  # GET /transacciones/new
  def new
		authorize! :new, Transaccion
    @transaccion = Transaccion.new
  end

  # GET /transacciones/1/edit
  def edit
	authorize! :edit, Transaccion
  end

  # POST /transacciones
  # POST /transacciones.json
  def create
		authorize! :create, Transaccion
    @transaccion = Transaccion.new(transaccion_params)

    respond_to do |format|
      if @transaccion.save
        format.html { redirect_to @transaccion, notice: 'Transaccion fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @transaccion }
      else
        format.html { render :new }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transacciones/1
  # PATCH/PUT /transacciones/1.json
  def update
		authorize! :update, Transaccion
    respond_to do |format|
      if @transaccion.update(transaccion_params)
        format.html { redirect_to @transaccion, notice: 'Transaccion fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @transaccion }
      else
        format.html { render :edit }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transacciones/1
  # DELETE /transaciones/1.json
  def destroy
		authorize! :destroy, Transaccion
    @transaccion.destroy
    respond_to do |format|
      format.html { redirect_to transacciones_url, notice: 'Transaccion fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

	def control_usuario
		authorize! :control_usuario, Transaccion
	end
	def control_fecha
		authorize! :control_fecha, Transaccion
				if params[:f_inicio]
    				@fecha_inicio = Date.new(
      				params[:f_inicio][:year].to_i,
      				params[:f_inicio][:month].to_i,
      				params[:f_inicio][:day].to_i
    				).beginning_of_day
 			 	else
    				@fecha_inicio = Date.today.beginning_of_day
  			end
				if params[:f_fin]
						@fecha_fin = Date.new(
							params[:f_fin][:year].to_i,
							params[:f_fin][:month].to_i,
							params[:f_fin][:day].to_i
						).end_of_day
  			else
    				@fecha_fin = Date.today.end_of_day
  			end
	end
	def control_proyecto
		authorize! :control_proyecto, Transaccion
	end
	def auditoria
		authorize! :auditoria, Transaccion
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaccion
      @transaccion = Transaccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaccion_params
      params.require(:transaccion).permit(:descripcion, :proyecto_id, :tipo_transaccion_id, :sesion_id	)
    end
end
