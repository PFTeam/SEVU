class NotificacionSistemasController < ApplicationController
  before_action :set_notificacion_sistema, only: [:show, :edit, :update, :destroy]
  after_action :marcado_notificado, only: [:index]

  # GET /notificacion_sistemas
  # GET /notificacion_sistemas.json
  def index
		authorize! :index, NotificacionSistema
	  @notificacion_sistemas = [] || @notificacion_sistemas = NotificacionSistema.all.where(usuarioDestino: current_usuario)
	  #@notificacion_sistemas = NotificacionSistema.all
  end

  # GET /notificacion_sistemas/1
  # GET /notificacion_sistemas/1.json
  def show
		authorize! :show, NotificacionSistema
	  @notificacion_sistema.notificado = true
	  @notificacion_sistema.save
  end

  # GET /notificacion_sistemas/new
  def new
		authorize! :new, NotificacionSistema
    @notificacion_sistema = NotificacionSistema.new
  end

  # GET /notificacion_sistemas/1/edit
  def edit
		authorize! :edit, NotificacionSistema
  end

  # POST /notificacion_sistemas
  # POST /notificacion_sistemas.json
  def create
		authorize! :create, NotificacionSistema
    @notificacion_sistema = NotificacionSistema.new(notificacion_sistema_params)

    respond_to do |format|
      if @notificacion_sistema.save
        format.html { redirect_to @notificacion_sistema, notice: 'Notificacion sistema fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @notificacion_sistema }
      else
        format.html { render :new }
        format.json { render json: @notificacion_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificacion_sistemas/1
  # PATCH/PUT /notificacion_sistemas/1.json
  def update
		authorize! :update, NotificacionSistema
    respond_to do |format|
      if @notificacion_sistema.update(notificacion_sistema_params)
        format.html { redirect_to @notificacion_sistema, notice: 'Notificacion sistema fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @notificacion_sistema }
      else
        format.html { render :edit }
        format.json { render json: @notificacion_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacion_sistemas/1
  # DELETE /notificacion_sistemas/1.json
  def destroy
		authorize! :destroy, NotificacionSistema
    @notificacion_sistema.destroy
    respond_to do |format|
      format.html { redirect_to notificacion_sistemas_url, notice: 'Notificacion sistema fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
  def marcado_notificado
		authorize! :marcado_notificado, NotificacionSistema
	  #@notificacion_sistemas = NotificacionSistema.all.where(usuarioDestino: current_usuario)
	  @notificacion_sistemas.each do |notificacion|
		  if notificacion.notificado == false
			  notificacion.notificado = true
			  notificacion.save
		  end
	  end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion_sistema
      @notificacion_sistema = NotificacionSistema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_sistema_params
      params[:notificacion_sistema]
    end
end
