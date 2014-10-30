class AsistenciaEventosController < ApplicationController
  before_action :set_asistencia_evento, only: [:show, :edit, :update, :destroy]

  # GET /asistencia_eventos
  # GET /asistencia_eventos.json
  def index
		authorize! :index, AsistenciaEvento
    @asistencia_eventos = AsistenciaEvento.all
  end

  # GET /asistencia_eventos/1
  # GET /asistencia_eventos/1.json
  def show
		authorize! :show, AsistenciaEvento
  end

  # GET /asistencia_eventos/new
  def new
		authorize! :new, AsistenciaEvento
    @asistencia_evento = AsistenciaEvento.new
  end

  # GET /asistencia_eventos/1/edit
  def edit
		authorize! :edit, AsistenciaEvento
  end

  # POST /asistencia_eventos
  # POST /asistencia_eventos.json
  def create
		authorize! :create, AsistenciaEvento
    @asistencia_evento = AsistenciaEvento.new(asistencia_evento_params)

    respond_to do |format|
      if @asistencia_evento.save
	format.html {redirect_to :controller => 'evento_publicos', :action => 'index'
	      flash[:notice] = 'Se ha registrado tu participación'  } 
        format.json { render :show, status: :created, location: @asistencia_evento }
      else
        format.html { render :new }
        format.json { render json: @asistencia_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistencia_eventos/1
  # PATCH/PUT /asistencia_eventos/1.json
  def update
		authorize! :update, AsistenciaEvento
    respond_to do |format|
      if @asistencia_evento.update(asistencia_evento_params)
        format.html { redirect_to @asistencia_evento, notice: 'Asistencia evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @asistencia_evento }
      else
        format.html { render :edit }
        format.json { render json: @asistencia_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencia_eventos/1
  # DELETE /asistencia_eventos/1.json
  def destroy
		authorize! :destroy, AsistenciaEvento
    @asistencia_evento.destroy
    respond_to do |format|
      format.html { redirect_to asistencia_eventos_url, notice: 'Asistencia evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistencia_evento
      @asistencia_evento = AsistenciaEvento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistencia_evento_params
      params.require(:asistencia_evento).permit(:fechaCreacion, :evento_publico_id, :usuario_id)
    end
end
