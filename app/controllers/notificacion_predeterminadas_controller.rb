class NotificacionPredeterminadasController < ApplicationController
  before_action :set_notificacion_predeterminada, only: [:show, :edit, :update, :destroy]
  before_action :set_proyecto, only: [:index, :new, :create, :notificaciones_predeterminadas]

  # GET /notificacion_predeterminadas
  # GET /notificacion_predeterminadas.json
  def index
		authorize! :index, Notificacion
    #@notificacion_predeterminadas = NotificacionPredeterminada.all
    @notificacion_predeterminadas = @proyecto.notificacion_predeterminadas
  end

  # GET /notificacion_predeterminadas/1
  # GET /notificacion_predeterminadas/1.json
  def show
		authorize! :show, Notificacion
  end

  # GET /notificacion_predeterminadas/new
  def new
		authorize! :new, Notificacion
    #@notificacion_predeterminada = NotificacionPredeterminada.new
    @notificacion_predeterminada = @proyecto.notificacion_predeterminadas.new
    
  end

  # GET /notificacion_predeterminadas/1/edit
  def edit
		authorize! :edit, Notificacion
  end

  # POST /notificacion_predeterminadas
  # POST /notificacion_predeterminadas.json
  def create
		authorize! :create, Notificacion
    #@notificacion_predeterminada = NotificacionPredeterminada.new(notificacion_predeterminada_params)
    @notificacion_predeterminada = @proyecto.notificacion_predeterminadas.new(notificacion_predeterminada_params)

    respond_to do |format|
      if @notificacion_predeterminada.save
        format.html { redirect_to :back}#@notificacion_predeterminada, notice: 'Notificacion predeterminada fue creado satisfactoriamente.' }
        #format.json { render :back}#, status: :created, location: @notificacion_predeterminada }
      else
        format.html { render :back }
        format.json { render json: @notificacion_predeterminada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificacion_predeterminadas/1
  # PATCH/PUT /notificacion_predeterminadas/1.json
  def update
		authorize! :update, Notificacion
    respond_to do |format|
      if @notificacion_predeterminada.update(notificacion_predeterminada_params)
        format.html { redirect_to @notificacion_predeterminada, notice: 'Notificacion predeterminada fue actualizado satisfactoriamente.' }
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
		authorize! :destroy, Notificacion
    @notificacion_predeterminada.destroy
    respond_to do |format|
      format.html { redirect_to :back}#, notice: 'Notificacion predeterminada fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
  
  def gestionar_notificaciones
    @proyectos = Proyecto.where(id: AsignacionRol.find_by(usuario_id: current_usuario.id, esActual: true, rol_id: Rol.find_by(nombre: 'Director').id).proyecto_id)
  end

  def notificaciones_predeterminadas 

    @notificaciones_no_usadas = TipoNotificacion.all - @proyecto.tipo_notificaciones   #resto las listas
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion_predeterminada
      @notificacion_predeterminada = NotificacionPredeterminada.find(params[:id])
    end

    def set_proyecto
      @proyecto = Proyecto.find params[:proyecto_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_predeterminada_params
      params.permit(:proyecto_id, :tipo_notificacion_id)
    end
end
