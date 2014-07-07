class ExperienciaController < ApplicationController
  before_action :set_experiencium, only: [:show, :edit, :update, :destroy]

  # GET /experiencia
  # GET /experiencia.json
  def index
    @experiencia = Experiencium.all
  end

  # GET /experiencia/1
  # GET /experiencia/1.json
  def show
  end

  # GET /experiencia/new
  def new
    @experiencium = Experiencium.new
  end

  # GET /experiencia/1/edit
  def edit
  end

  # POST /experiencia
  # POST /experiencia.json
  def create
    @experiencium = Experiencium.new(experiencium_params)

    respond_to do |format|
      if @experiencium.save
        format.html { redirect_to @experiencium, notice: 'Experiencium was successfully created.' }
        format.json { render :show, status: :created, location: @experiencium }
      else
        format.html { render :new }
        format.json { render json: @experiencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiencia/1
  # PATCH/PUT /experiencia/1.json
  def update
    respond_to do |format|
      if @experiencium.update(experiencium_params)
        format.html { redirect_to @experiencium, notice: 'Experiencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiencium }
      else
        format.html { render :edit }
        format.json { render json: @experiencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiencia/1
  # DELETE /experiencia/1.json
  def destroy
    @experiencium.destroy
    respond_to do |format|
      format.html { redirect_to experiencia_url, notice: 'Experiencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiencium
      @experiencium = Experiencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experiencium_params
      params.require(:experiencium).permit(:tieneExperiencia, :cantidadExperiencia, :habilidad_id, :voluntario_id)
    end
end
