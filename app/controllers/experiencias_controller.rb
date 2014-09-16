class ExperienciasController < ApplicationController
  before_action :set_voluntario, only: [:new, :create]
  before_action :set_experiencia, only: [:show, :edit, :update, :destroy]


  
  # GET /experiencias
  # GET /experiencias.json
  def index
    @experiencias = Experiencia.all
    
  end

  # GET /experiencias/1
  # GET /experiencias/1.json
  def show
  end

  # GET /experiencias/new
  def new
    @experiencia = @voluntario.experiencias.new
  end

  # GET /experiencias/1/edit
  def edit
  end

  # POST /experiencias
  # POST /experiencias.json
  def create
    @experiencia = @voluntario.experiencias.new(experiencia_params)

    respond_to do |format|
      if @experiencia.save
        format.html { redirect_to @experiencia, notice: 'Experiencia was successfully created.' }
        format.json { render :show, status: :created, location: @experiencia }
      else
        format.html { render :new }
        format.json { render json: @experiencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiencias/1
  # PATCH/PUT /experiencias/1.json
  def update
    respond_to do |format|
      if @experiencia.update(experiencia_params)
        format.html { redirect_to @experiencia, notice: 'Experiencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiencia }
      else
        format.html { render :edit }
        format.json { render json: @experiencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiencias/1
  # DELETE /experiencias/1.json
  def destroy
    @experiencia.destroy
    respond_to do |format|
      format.html { redirect_to experiencias_url, notice: 'Experiencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiencia
      @experiencia = Experiencia.find(params[:id])
    end

def set_voluntario
  @voluntario = Voluntario.find(params[:voluntario_id])
end
    # Never trust parameters from the scary internet, only allow the white list through.
    def experiencia_params
      params.require(:experiencia).permit(:tieneExperiencia, :cantidadExperiencia, :habilidad_id, :voluntario_id)
    end
end
