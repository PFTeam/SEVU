class HistorialEstadoUsuariosController < ApplicationController
  before_action :set_historial_estado_usuario, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_usuarios
  # GET /historial_estado_usuarios.json
  def index
		authorize! :index, HistorialEstadoUsuario
    @historial_estado_usuarios = HistorialEstadoUsuario.all
  end

  # GET /historial_estado_usuarios/1
  # GET /historial_estado_usuarios/1.json
  def show

		authorize! :show, HistorialEstadoUsuario
    @historial_estado_usuario=HistorialEstadoUsuario.find(params[:id])

  end

  # GET /historial_estado_usuarios/new
  def new

		authorize! :new, HistorialEstadoUsuario
    @usuario=Usuario.all
    @proyecto= Proyecto.all
     @estado_usuarios = EstadoUsuario.all
    @historial_estado_usuario = HistorialEstadoUsuario.new
     
  end

  # GET /historial_estado_usuarios/1/edit
  def edit
		authorize! :edit, HistorialEstadoUsuario
  end

  # POST /historial_estado_usuarios
  # POST /historial_estado_usuarios.json
  def create
		authorize! :create, HistorialEstadoUsuario
    @historial_estado_usuario = HistorialEstadoUsuario.new(historial_estado_usuario_params)

    respond_to do |format|
      if @historial_estado_usuario.save
        format.html { redirect_to @historial_estado_usuario, notice: 'Historial estado fue creado satisfactoria mente' }
        #format.json { render :show, status: :created, location: @historial_estado_usuario }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_usuarios/1
  # PATCH/PUT /historial_estado_usuarios/1.json
  def update
		authorize! :update, HistorialEstadoUsuario
    respond_to do |format|
      if @historial_estado_usuario.update(historial_estado_usuario_params)
        format.html { redirect_to @historial_estado_usuario, notice: 'Historial estado usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_usuario }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_usuarios/1
  # DELETE /historial_estado_usuarios/1.json
  def destroy
		authorize! :destroy, HistorialEstadoUsuario
    @historial_estado_usuario.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_usuarios_url, notice: 'Historial estado usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_usuario
       @historial_estado_usuario = HistorialEstadoUsuario.where(usuario_id:  params[:id])
     # @historial_estado_usuario = HistorialEstadoUsuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_usuario_params
      params.require(:historial_estado_usuario).permit( :usuario_id, :estado_usuario_id)
    end
end
