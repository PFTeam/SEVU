class ExperienciasController < ApplicationController
  before_action :set_voluntario, only: [:new, :create]
  before_action :set_experiencia, only: [:show, :edit, :update, :destroy]
  before_action :set_habilidad, only: [:new, :create,:show,:edit  ]

def set_habilidad 
@habilidades = Habilidad.all
end

  # GET /experiencias
  # GET /experiencias.json
  def index
		authorize! :index, Experiencia
    @experiencias = Experiencia.all
    
  end

  # GET /experiencias/1
  # GET /experiencias/1.json
  def show
		authorize! :show, Experiencia
  end

  # GET /experiencias/new
  def new

  
    

		authorize! :new, Experiencia
    #@experiencia = Experiencia.new
  @experiencia = @voluntario.experiencias.new
  end

  # GET /experiencias/1/edit
  def edit

		authorize! :edit, Experiencia
    @voluntario = Voluntario.find( @experiencia.voluntario_id)
  end

  # POST /experiencias
  # POST /experiencias.json
  def create

		authorize! :create, Experiencia
    # @voluntario = Voluntario.find(params[:voluntario_id])
    @experiencia = @voluntario.experiencias.new(experiencia_params)
    #@experiencia = Experiencia.new(experiencia_params)
    respond_to do |format|
      if @experiencia.save
        format.html { redirect_to gestionar_experiencias_path(@voluntario), notice: 'La experiencia fue creada Exitosamente.' }
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

		authorize! :update, Experiencia
    @voluntario = Voluntario.find(params[:voluntario_id])
    respond_to do |format|
      if @experiencia.update(experiencia_params)
        format.html { redirect_to gestionar_experiencias_path(@voluntario), notice: 'La experiencia fue Actualizada Exitosamente.' }
     #   format.json { render :show, status: :ok, location: @experiencia }
      else
        format.html { render :edit }
        format.json { render json: @experiencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiencias/1
  # DELETE /experiencias/1.json
  def destroy

		authorize! :destroy, Experiencia
     @voluntario = Voluntario.find(@experiencia.voluntario_id)
    @experiencia.destroy
    respond_to do |format|
      format.html { redirect_to gestionar_experiencias_path(@voluntario), notice: 'La experiencia fue eliminada Exitosamente.' }
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
     
   #  params.permit! permite todo los atriburos
     params.require(:experiencia).permit(:tieneExperiencia, :cantidadExperiencia, :habilidad_id, :voluntario_id)
    
    end
end
