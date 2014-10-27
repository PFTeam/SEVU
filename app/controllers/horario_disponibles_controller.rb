class HorarioDisponiblesController < ApplicationController
  before_action :set_horario_disponibl, only: [:show, :edit, :update, :destroy]

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
    @horario_disponibl = HorarioDisponible.new
  end

  # GET /horario_disponibles/1/edit
  def edit
		authorize! :edit, HorarioDisponible
  end

  # POST /horario_disponibles
  # POST /horario_disponibles.json
  def create
		authorize! :create, HorarioDisponible
    @horario_disponibl = HorarioDisponible.new(horario_disponibl_params)

    respond_to do |format|
      if @horario_disponibl.save
        format.html { redirect_to @horario_disponibl, notice: 'Horario disponible was successfully created.' }
        format.json { render :show, status: :created, location: @horario_disponibl }
      else
        format.html { render :new }
        format.json { render json: @horario_disponibl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horario_disponibles/1
  # PATCH/PUT /horario_disponibles/1.json
  def update
		authorize! :update, HorarioDisponible
    respond_to do |format|
      if @horario_disponibl.update(horario_disponibl_params)
        format.html { redirect_to @horario_disponibl, notice: 'Horario disponible was successfully updated.' }
        format.json { render :show, status: :ok, location: @horario_disponibl }
      else
        format.html { render :edit }
        format.json { render json: @horario_disponibl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horario_disponibles/1
  # DELETE /horario_disponibles/1.json
  def destroy
		authorize! :destroy, HorarioDisponible
    @horario_disponibl.destroy
    respond_to do |format|
      format.html { redirect_to horario_disponibles_url, notice: 'Horario disponible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario_disponibl
      @horario_disponibl = HorarioDisponible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_disponibl_params
      params.require(:horario_disponibl).permit(:diaSemana, :horaDesde, :horaHasta, :voluntario_id)
    end
end
