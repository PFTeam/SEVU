class ActividadHabilidadesController < ApplicationController
  before_action :set_actividad_habilidad, only: [:show, :edit, :update, :destroy]

  # GET /actividad_habilidades
  # GET /actividad_habilidades.json
  def index
    @actividad_habilidades = ActividadHabilidad.all
  end

  # GET /actividad_habilidades/1
  # GET /actividad_habilidades/1.json
  def show
  end

  # GET /actividad_habilidades/new
  def new
    @actividad_habilidad = ActividadHabilidad.new
  end

  # GET /actividad_habilidades/1/edit
  def edit
  end

  # POST /actividad_habilidades
  # POST /actividad_habilidades.json
  def create
    @actividad_habilidad = ActividadHabilidad.new(actividad_habilidad_params)

    respond_to do |format|
      if @actividad_habilidad.save
        format.html { redirect_to @actividad_habilidad, notice: 'Actividad habilidad was successfully created.' }
        format.json { render :show, status: :created, location: @actividad_habilidad }
      else
        format.html { render :new }
        format.json { render json: @actividad_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividad_habilidades/1
  # PATCH/PUT /actividad_habilidades/1.json
  def update
    respond_to do |format|
      if @actividad_habilidad.update(actividad_habilidad_params)
        format.html { redirect_to @actividad_habilidad, notice: 'Actividad habilidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad_habilidad }
      else
        format.html { render :edit }
        format.json { render json: @actividad_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_habilidades/1
  # DELETE /actividad_habilidades/1.json
  def destroy
    @actividad_habilidad.destroy
    respond_to do |format|
      format.html { redirect_to actividad_habilidades_url, notice: 'Actividad habilidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad_habilidad
      @actividad_habilidad = ActividadHabilidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_habilidad_params
      params.require(:actividad_habilidad).permit(:actividad_id, :habilidad_id)
    end
end
