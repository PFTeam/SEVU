class TipoActividadesController < ApplicationController
  before_action :set_tipo_actividad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_actividades
  # GET /tipo_actividades.json
  def index
		authorize! :index, TipoActividad
    @tipo_actividades = TipoActividad.all
  end

  # GET /tipo_actividades/1
  # GET /tipo_actividades/1.json
  def show
		authorize! :show, TipoActividad
  end

  # GET /tipo_actividades/new
  def new
		authorize! :new, TipoActividad
    @tipo_actividad = TipoActividad.new
  end

  # GET /tipo_actividades/1/edit
  def edit
		authorize! :edit, TipoActividad
  end

  # POST /tipo_actividades
  # POST /tipo_actividades.json
  def create
		authorize! :create, TipoActividad
    @tipo_actividad = TipoActividad.new(tipo_actividad_params)

    respond_to do |format|
      if @tipo_actividad.save
        format.html { redirect_to @tipo_actividad, notice: 'Tipo actividad 'fue creado satisfactoriamente'.' }
        format.json { render :show, status: :created, location: @tipo_actividad }
      else
        format.html { render :new }
        format.json { render json: @tipo_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_actividades/1
  # PATCH/PUT /tipo_actividades/1.json
  def update
		authorize! :update, TipoActividad
    respond_to do |format|
      if @tipo_actividad.update(tipo_actividad_params)
        format.html { redirect_to @tipo_actividad, notice: 'Tipo actividad 'fue actualizado satisfactoriamente'.' }
        format.json { render :show, status: :ok, location: @tipo_actividad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_actividades/1
  # DELETE /tipo_actividades/1.json
  def destroy
		authorize! :destroy, TipoActividad
    @tipo_actividad.destroy
    respond_to do |format|
      format.html { redirect_to tipo_actividades_url, notice: 'Tipo actividad 'fue borrado satisfactoriamente'.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_actividad
      @tipo_actividad = TipoActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_actividad_params
      params.require(:tipo_actividad).permit(:titulo, :descripcion)
    end
end
