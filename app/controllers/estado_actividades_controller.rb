class EstadoActividadesController < ApplicationController
  before_action :set_estado_actividad, only: [:show, :edit, :update, :destroy]

  # GET /estado_actividades
  # GET /estado_actividades.json
  def index
		authorize! :index, EstadoActividad
    @estado_actividades = EstadoActividad.all
  end

  # GET /estado_actividades/1
  # GET /estado_actividades/1.json
  def show
		authorize! :show, EstadoActividad
  end

  # GET /estado_actividades/new
  def new
		authorize! :new, EstadoActividad
    @estado_actividad = EstadoActividad.new
  end

  # GET /estado_actividades/1/edit
  def edit
		authorize! :edit, EstadoActividad
  end

  # POST /estado_actividades
  # POST /estado_actividades.json
  def create
		authorize! :create, EstadoActividad
    @estado_actividad = EstadoActividad.new(estado_actividad_params)

    respond_to do |format|
      if @estado_actividad.save
        format.html { redirect_to @estado_actividad, notice: 'Estado actividad was successfully created.' }
        format.json { render :show, status: :created, location: @estado_actividad }
      else
        format.html { render :new }
        format.json { render json: @estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_actividades/1
  # PATCH/PUT /estado_actividades/1.json
  def update
		authorize! :update, EstadoActividad
    respond_to do |format|
      if @estado_actividad.update(estado_actividad_params)
        format.html { redirect_to @estado_actividad, notice: 'Estado actividad was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_actividad }
      else
        format.html { render :edit }
        format.json { render json: @estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_actividades/1
  # DELETE /estado_actividades/1.json
  def destroy
		authorize! :destroy, EstadoActividad
    @estado_actividad.destroy
    respond_to do |format|
      format.html { redirect_to estado_actividades_url, notice: 'Estado actividad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_actividad
      @estado_actividad = EstadoActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_actividad_params
      params.require(:estado_actividad).permit(:nombre)
    end
end
