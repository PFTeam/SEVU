class NotificacionPredeterminadasController < ApplicationController
  before_action :set_notificacion_predeterminada, only: [:show, :edit, :update, :destroy]

  # GET /notificacion_predeterminadas
  # GET /notificacion_predeterminadas.json
  def index
    @notificacion_predeterminadas = NotificacionPredeterminada.all
  end

  # GET /notificacion_predeterminadas/1
  # GET /notificacion_predeterminadas/1.json
  def show
  end

  # GET /notificacion_predeterminadas/new
  def new
    @notificacion_predeterminada = NotificacionPredeterminada.new
  end

  # GET /notificacion_predeterminadas/1/edit
  def edit
  end

  # POST /notificacion_predeterminadas
  # POST /notificacion_predeterminadas.json
  def create
    @notificacion_predeterminada = NotificacionPredeterminada.new(notificacion_predeterminada_params)

    respond_to do |format|
      if @notificacion_predeterminada.save
        format.html { redirect_to @notificacion_predeterminada, notice: 'Notificacion predeterminada was successfully created.' }
        format.json { render :show, status: :created, location: @notificacion_predeterminada }
      else
        format.html { render :new }
        format.json { render json: @notificacion_predeterminada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificacion_predeterminadas/1
  # PATCH/PUT /notificacion_predeterminadas/1.json
  def update
    respond_to do |format|
      if @notificacion_predeterminada.update(notificacion_predeterminada_params)
        format.html { redirect_to @notificacion_predeterminada, notice: 'Notificacion predeterminada was successfully updated.' }
        format.json { render :show, status: :ok, location: @notificacion_predeterminada }
      else
        format.html { render :edit }
        format.json { render json: @notificacion_predeterminada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacion_predeterminadas/1
  # DELETE /notificacion_predeterminadas/1.json
  def destroy
    @notificacion_predeterminada.destroy
    respond_to do |format|
      format.html { redirect_to notificacion_predeterminadas_url, notice: 'Notificacion predeterminada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion_predeterminada
      @notificacion_predeterminada = NotificacionPredeterminada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_predeterminada_params
      params.require(:notificacion_predeterminada).permit(:proyecto_id, :tipo_notificacion_id)
    end
end
