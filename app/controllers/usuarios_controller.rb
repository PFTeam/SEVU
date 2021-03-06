class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json

  def dar_alta_voluntario
			authorize! :dar_alta_voluntario, Usuario
      @usuario = @current_usuario
  end
  
  def index
		authorize! :index, Usuario
    @usuarios = Usuario.page(params[:page]).search query: params[:q]
    #@usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
		authorize! :show, Usuario
  end

  # GET /usuarios/new
  def new
		authorize! :new, Usuario
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
		authorize! :edit, Usuario
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
		
		authorize! :create, Usuario
		
    @usuario = Usuario.new(usuario_params)
		
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
		authorize! :update, Usuario
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to :root, notice: "Usuario actualizado correctamente" }#@usuario, notice: 'Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
		

  def destroy
		authorize! :destroy, Usuario
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

	def usuario_bloqueado
	end
	
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombreUsuario, :encrypted_password, :apellido_nombre, :email, :direccion, :foto, :legajo, :type)
    end
end
