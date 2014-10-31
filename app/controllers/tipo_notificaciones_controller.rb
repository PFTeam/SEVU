class TipoNotificacionesController < ApplicationController
  before_action :set_tipo_notificacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_notificaciones
  # GET /tipo_notificaciones.json
  def index
		authorize! :index, TipoNotificacion
    @tipo_notificaciones = TipoNotificacion.all
  end

  # GET /tipo_notificaciones/1
  # GET /tipo_notificaciones/1.json
  def show
		authorize! :show, TipoNotificacion
  end

  # GET /tipo_notificaciones/new
  def new
		authorize! :new, TipoNotificacion
    @tipo_notificacion = TipoNotificacion.new
  end

  # GET /tipo_notificaciones/1/edit
  def edit
		authorize! :edit, TipoNotificacion
  end

  # POST /tipo_notificaciones
  # POST /tipo_notificaciones.json
  def create
		authorize! :create, TipoNotificacion
    @tipo_notificacion = TipoNotificacion.new(tipo_notificacion_params)

    respond_to do |format|
      if @tipo_notificacion.save
        format.html { redirect_to @tipo_notificacion, notice: 'Tipo notificacion was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_notificacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_notificaciones/1
  # PATCH/PUT /tipo_notificaciones/1.json
  def update
		authorize! :update, TipoNotificacion
    respond_to do |format|
      if @tipo_notificacion.update(tipo_notificacion_params)
        format.html { redirect_to @tipo_notificacion, notice: 'Tipo notificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_notificacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_notificaciones/1
  # DELETE /tipo_notificaciones/1.json
  def destroy
		authorize! :destroy, TipoNotificacion
    @tipo_notificacion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_notificaciones_url, notice: 'Tipo notificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_notificacion
      @tipo_notificacion = TipoNotificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_notificacion_params
      params.require(:tipo_notificacion).permit(:nombre)
    end
end
