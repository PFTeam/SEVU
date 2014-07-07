class ProyectoTipoNotificacionsController < ApplicationController
  before_action :set_proyecto_tipo_notificacion, only: [:show, :edit, :update, :destroy]

  # GET /proyecto_tipo_notificacions
  # GET /proyecto_tipo_notificacions.json
  def index
    @proyecto_tipo_notificacions = ProyectoTipoNotificacion.all
  end

  # GET /proyecto_tipo_notificacions/1
  # GET /proyecto_tipo_notificacions/1.json
  def show
  end

  # GET /proyecto_tipo_notificacions/new
  def new
    @proyecto_tipo_notificacion = ProyectoTipoNotificacion.new
  end

  # GET /proyecto_tipo_notificacions/1/edit
  def edit
  end

  # POST /proyecto_tipo_notificacions
  # POST /proyecto_tipo_notificacions.json
  def create
    @proyecto_tipo_notificacion = ProyectoTipoNotificacion.new(proyecto_tipo_notificacion_params)

    respond_to do |format|
      if @proyecto_tipo_notificacion.save
        format.html { redirect_to @proyecto_tipo_notificacion, notice: 'Proyecto tipo notificacion was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto_tipo_notificacion }
      else
        format.html { render :new }
        format.json { render json: @proyecto_tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyecto_tipo_notificacions/1
  # PATCH/PUT /proyecto_tipo_notificacions/1.json
  def update
    respond_to do |format|
      if @proyecto_tipo_notificacion.update(proyecto_tipo_notificacion_params)
        format.html { redirect_to @proyecto_tipo_notificacion, notice: 'Proyecto tipo notificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto_tipo_notificacion }
      else
        format.html { render :edit }
        format.json { render json: @proyecto_tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_tipo_notificacions/1
  # DELETE /proyecto_tipo_notificacions/1.json
  def destroy
    @proyecto_tipo_notificacion.destroy
    respond_to do |format|
      format.html { redirect_to proyecto_tipo_notificacions_url, notice: 'Proyecto tipo notificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto_tipo_notificacion
      @proyecto_tipo_notificacion = ProyectoTipoNotificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_tipo_notificacion_params
      params.require(:proyecto_tipo_notificacion).permit(:proyecto_id, :tipo_notificacion_id)
    end
end
