class VoluntariosController < ApplicationController
  
  before_action :set_voluntario, only: [:show, :edit, :update, :destroy, :gestionar_experiencias, 
    :gestion_horarios_disponibles,:gestion_horario_disponibles]
    #ingerto juan
  before_action :set_todasHabilidades, only: [ :gestionar_experiencias, :gestion_horarios_disponibles,:gestion_horario_disponibles]

 def set_todasHabilidades
    @habilidades = Habilidad.all
  end
#fin ingerto juan

  # GET /voluntarios
  # GET /voluntarios.json
  def index
    @voluntarios = Voluntario.all
  end
#Pagina Nota Personal
  def gestionar_nota_P
   # @voluntario = Voluntario.find(params[:id]) 
  #  @notap = Nota.find(params[:id])
  
  end
  # GET /voluntarios/1
  # GET /voluntarios/1.json
  def show
  end

  # GET /voluntarios/new
  def new
    @voluntario = Voluntario.new
  end
 
  def gestionar_experiencias
  
  end
  
  
  
  # GET /voluntarios/1/edit
  def edit
  end

  # POST /voluntarios
  # POST /voluntarios.json
  def create
    @voluntario = Voluntario.new(voluntario_params)

    respond_to do |format|
      if @voluntario.save
        format.html { redirect_to @voluntario, notice: 'Voluntario was successfully created.' }
        format.json { render :show, status: :created, location: @voluntario }
      else
        format.html { render :new }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voluntarios/1
  # PATCH/PUT /voluntarios/1.json
  def update
    respond_to do |format|
      if @voluntario.update(voluntario_params)
        format.html { redirect_to @voluntario, notice: 'Voluntario was successfully updated.' }
        format.json { render :show, status: :ok, location: @voluntario }
      else
        format.html { render :edit }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntarios/1
  # DELETE /voluntarios/1.json
  def destroy
    @voluntario.destroy
    respond_to do |format|
      format.html { redirect_to voluntarios_url, notice: 'Voluntario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def gestion_horarios_disponibles
  
  @voluntario = Voluntario.find(params[:id])
  #@horario_disponibles = HorarioDisponible.where(voluntario_id: :id)
end


    # Use callbacks to share common setup or constraints between actions.
    def set_voluntario
       @voluntario = Voluntario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voluntario_params
      params.require(:voluntario).permit(:legajo, :id)
    end
 private
end


  
