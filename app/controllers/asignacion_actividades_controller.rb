class AsignacionActividadesController < ApplicationController
  before_action :set_asignacion_actividad, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_actividades
  # GET /asignacion_actividades.json
  def index
    @asignacion_actividades = AsignacionActividad.all
  end

  # GET /asignacion_actividades/1
  # GET /asignacion_actividades/1.json
  def show
  end

  # GET /asignacion_actividades/new
  def new
    @asignacion_actividad = AsignacionActividad.new
  end

  # GET /asignacion_actividades/1/edit
  def edit
  end

  # POST /asignacion_actividades
  # POST /asignacion_actividades.json
  def create
    @asignacion_actividad = AsignacionActividad.new(asignacion_actividad_params)

    respond_to do |format|
      if @asignacion_actividad.save
        format.html { redirect_to @asignacion_actividad, notice: 'Asignacion actividad was successfully created.' }
        format.json { render :show, status: :created, location: @asignacion_actividad }
      else
        format.html { render :new }
        format.json { render json: @asignacion_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_actividades/1
  # PATCH/PUT /asignacion_actividades/1.json
  def update
    respond_to do |format|
      if @asignacion_actividad.update(asignacion_actividad_params)
        format.html { redirect_to @asignacion_actividad, notice: 'Asignacion actividad was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignacion_actividad }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_actividades/1
  # DELETE /asignacion_actividades/1.json
  def destroy
    @asignacion_actividad.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_actividades_url, notice: 'Asignacion actividad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_actividad
      @asignacion_actividad = AsignacionActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_actividad_params
      params.require(:asignacion_actividad).permit(:vigente, :fechaAsignacion, :actividad_id, :usuario_id)
    end
end