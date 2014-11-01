class HorarioDisponiblesController < ApplicationController
  before_action :set_horario_disponible, only: [:show, :edit, :update, :destroy]
#  before_action :set_voluntario, only: [ :index]
 before_action :set_voluntario, only: [:new, :create]


  # GET /horario_disponibles
  # GET /horario_disponibles.json
  def index
		authorize! :index, HorarioDisponible
    @horario_disponibles = HorarioDisponible.all
  end

  # GET /horario_disponibles/1
  # GET /horario_disponibles/1.json
  def show
		authorize! :show, HorarioDisponible
  end

  # GET /horario_disponibles/new
  def new
	authorize! :new, HorarioDisponible
    #@horario_disponibl = HorarioDisponible.new
   @voluntario = Voluntario.find(params[:voluntario_id])
#@horario_disponible  = @voluntario.horario_disponibles.new()
    puts @voluntario.legajo
   
    @horario_disponible=HorarioDisponible.new
  end

  # GET /horario_disponibles/1/edit
  def edit
		authorize! :edit, HorarioDisponible
@voluntario=Voluntario.find(@horario_disponible.voluntario_id)

  end

  # POST /horario_disponibles
  # POST /horario_disponibles.json
  def create

		authorize! :create, HorarioDisponible
    #@horario_disponibl = HorarioDisponible.new(horario_disponibl_params)

@voluntario = Voluntario.find(params[:voluntario_id])
 #@horario_disponible  = @voluntario.horario_disponibles.new(horario_disponible_params)

 @horario_disponible = HorarioDisponible.new(horario_disponible_params)
   
    respond_to do |format|
      if @horario_disponible.save
        
        format.html { redirect_to gestion_horarios_disponibles_path(@voluntario), notice: 'Horario disponible 'fue creado satisfactoriamente'.' }
       # format.json { render :show, status: :created, location: @horario_disponibl }
      else
        format.html { render :new }
        format.json { render json: @horario_disponible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horario_disponibles/1
  # PATCH/PUT /horario_disponibles/1.json
  def update
		authorize! :update, HorarioDisponible
    respond_to do |format|
      if @horario_disponible.update(horario_disponible_params)
        format.html { redirect_to @horario_disponible, notice: 'Horario disponible 'fue actualizado satisfactoriamente'.' }
        format.json { render :show, status: :ok, location: @horario_disponible }
      else
        format.html { render :edit }
        format.json { render json: @horario_disponible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horario_disponibles/1
  # DELETE /horario_disponibles/1.json
  def destroy

		authorize! :destroy, HorarioDisponible
    #@horario_disponibl.destroy
    @voluntario = Voluntario.find( @horario_disponible.voluntario_id)
    @horario_disponible.destroy
    respond_to do |format|
    format.html { redirect_to gestion_horarios_disponibles_path(@voluntario), notice: 'Horario disponible 'fue creado satisfactoriamente'.' }
     # format.html { redirect_to horario_disponibles_url, notice: 'Horario disponible 'fue borrado satisfactoriamente'.' }
      format.json { head :no_content }
    end
  end

 
    # Use callbacks to share common setup or constraints between actions.
    def set_horario_disponible
      @horario_disponible = HorarioDisponible.find(params[:id])
     end

 private

    def set_voluntario
       @voluntario = Voluntario.find(params[:voluntario_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_disponible_params
      params.require(:horario_disponible).permit(:diaSemana, :horaDesde, :horaHasta, :voluntario_id)
    end
end
