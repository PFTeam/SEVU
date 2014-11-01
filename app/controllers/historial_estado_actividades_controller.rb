class HistorialEstadoActividadesController < ApplicationController
  before_action :set_historial_estado_actividad, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_actividades
  # GET /historial_estado_actividades.json
  def index
		authorize! :index, Habilidad
    @actividad = Actividad.find(params[:actividad_id])
    @proyecto = @actividad.proyecto
  end

  # GET /historial_estado_actividades/1
  # GET /historial_estado_actividades/1.json
  def show
		authorize! :show, Habilidad
  end

  # GET /historial_estado_actividades/new
  def new
		authorize! :new, Habilidad
    @historial_estado_actividad = HistorialEstadoActividad.new
  end

  # GET /historial_estado_actividades/1/edit
  def edit
		authorize! :edit, Habilidad
	  @proyecto = @historial_estado_actividad.actividad.proyecto
	  @estados_posibles = EstadoActividad.estados_posibles(@historial_estado_actividad.actividad)
  end

  # POST /historial_estado_actividades
  # POST /historial_estado_actividades.json
  def create
		authorize! :create, Habilidad
    @historial_estado_actividad = HistorialEstadoActividad.new(historial_estado_actividad_params)

    respond_to do |format|
      if @historial_estado_actividad.save
        format.html { redirect_to @historial_estado_actividad 
		      flash[:notice] = 'Historial estado actividad fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @historial_estado_actividad }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_actividades/1
  # PATCH/PUT /historial_estado_actividades/1.json
  def update
		authorize! :update, Habilidad
    @historial_estado_actividad_nuevo = HistorialEstadoActividad.new
    @historial_estado_actividad_nuevo.actividad_id = params[:historial_estado_actividad][:actividad_id]
    @historial_estado_actividad_nuevo.estado_actividad_id = params[:historial_estado_actividad][:estado_actividad_id]
    respond_to do |format|
      if @historial_estado_actividad_nuevo.save
	      format.html { redirect_to action: 'index', actividad_id: @historial_estado_actividad.actividad.id 
		    flash[:notice] = 'Historial estado actividad fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @historial_estado_actividad }
      else
        format.html { render :edit}
        format.json { render json: @historial_estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_actividades/1
  # DELETE /historial_estado_actividades/1.json
  def destroy
		authorize! :destroy, Habilidad
    @historial_estado_actividad.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_actividades_url, notice: 'Historial estado actividad fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_actividad
      @historial_estado_actividad = HistorialEstadoActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_actividad_params
      params.require(:historial_estado_actividad).permit(:fechaCambioEstado, :esActual, :actividad_id, :estado_actividad_id)
    end
end
