class AsistenciaEventoPublicosController < ApplicationController
  before_action :set_asistencia_evento_publico, only: [:show, :edit, :update, :destroy]

  # GET /asistencia_evento_publicos
  # GET /asistencia_evento_publicos.json
  def index
    @asistencia_evento_publicos = AsistenciaEventoPublico.all
  end

  # GET /asistencia_evento_publicos/1
  # GET /asistencia_evento_publicos/1.json
  def show
  end

  # GET /asistencia_evento_publicos/new
  def new
    @asistencia_evento_publico = AsistenciaEventoPublico.new
  end

  # GET /asistencia_evento_publicos/1/edit
  def edit
  end

  # POST /asistencia_evento_publicos
  # POST /asistencia_evento_publicos.json
  def create
    @asistencia_evento_publico = AsistenciaEventoPublico.new(asistencia_evento_publico_params)

    respond_to do |format|
      if @asistencia_evento_publico.save
        format.html { redirect_to @asistencia_evento_publico, notice: 'Asistencia evento publico was successfully created.' }
        format.json { render :show, status: :created, location: @asistencia_evento_publico }
      else
        format.html { render :new }
        format.json { render json: @asistencia_evento_publico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistencia_evento_publicos/1
  # PATCH/PUT /asistencia_evento_publicos/1.json
  def update
    respond_to do |format|
      if @asistencia_evento_publico.update(asistencia_evento_publico_params)
        format.html { redirect_to @asistencia_evento_publico, notice: 'Asistencia evento publico was successfully updated.' }
        format.json { render :show, status: :ok, location: @asistencia_evento_publico }
      else
        format.html { render :edit }
        format.json { render json: @asistencia_evento_publico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencia_evento_publicos/1
  # DELETE /asistencia_evento_publicos/1.json
  def destroy
    @asistencia_evento_publico.destroy
    respond_to do |format|
      format.html { redirect_to asistencia_evento_publicos_url, notice: 'Asistencia evento publico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistencia_evento_publico
      @asistencia_evento_publico = AsistenciaEventoPublico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistencia_evento_publico_params
      params.require(:asistencia_evento_publico).permit(:fechaCreacion, :evento_publico_id, :usuario_id)
    end
end
