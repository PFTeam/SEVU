class HorarioDisponiblesController < ApplicationController
  before_action :set_horario_disponible, only: [:show, :edit, :update, :destroy]

  # GET /horario_disponibles
  # GET /horario_disponibles.json
  def index
    @horario_disponibles = HorarioDisponible.all
  end

  # GET /horario_disponibles/1
  # GET /horario_disponibles/1.json
  def show
  end

  # GET /horario_disponibles/new
  def new
    @horario_disponible = HorarioDisponible.new
  end

  # GET /horario_disponibles/1/edit
  def edit
  end

  # POST /horario_disponibles
  # POST /horario_disponibles.json
  def create
    @horario_disponible = HorarioDisponible.new(horario_disponible_params)

    respond_to do |format|
      if @horario_disponible.save
        format.html { redirect_to @horario_disponible, notice: 'Horario disponible was successfully created.' }
        format.json { render :show, status: :created, location: @horario_disponible }
      else
        format.html { render :new }
        format.json { render json: @horario_disponible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horario_disponibles/1
  # PATCH/PUT /horario_disponibles/1.json
  def update
    respond_to do |format|
      if @horario_disponible.update(horario_disponible_params)
        format.html { redirect_to @horario_disponible, notice: 'Horario disponible was successfully updated.' }
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
    @horario_disponible.destroy
    respond_to do |format|
      format.html { redirect_to horario_disponibles_url, notice: 'Horario disponible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario_disponible
      @horario_disponible = HorarioDisponible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_disponible_params
      params.require(:horario_disponible).permit(:diaSemana, :horaDesde, :horaHasta, :voluntario_id)
    end
end
