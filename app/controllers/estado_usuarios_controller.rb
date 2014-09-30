class EstadoUsuariosController < ApplicationController
  before_action :set_estado_usuario, only: [:show, :edit, :update, :destroy]

  # GET /estado_usuarios
  # GET /estado_usuarios.json
  def index
    @estado_usuarios = EstadoUsuario.all
  end

  # GET /estado_usuarios/1
  # GET /estado_usuarios/1.json
  def show
  end

  # GET /estado_usuarios/new
  def new
    @estado_usuario = EstadoUsuario.new
  end

  # GET /estado_usuarios/1/edit
  def edit
  end

  # POST /estado_usuarios
  # POST /estado_usuarios.json
  def create
    @estado_usuario = EstadoUsuario.new(estado_usuario_params)

    respond_to do |format|
      if @estado_usuario.save
        format.html { redirect_to @estado_usuario, notice: 'Estado usuario was successfully created.' }
        format.json { render :show, status: :created, location: @estado_usuario }
      else
        format.html { render :new }
        format.json { render json: @estado_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_usuarios/1
  # PATCH/PUT /estado_usuarios/1.json
  def update
    respond_to do |format|
      if @estado_usuario.update(estado_usuario_params)
        format.html { redirect_to @estado_usuario, notice: 'Estado usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_usuario }
      else
        format.html { render :edit }
        format.json { render json: @estado_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_usuarios/1
  # DELETE /estado_usuarios/1.json
  def destroy
    @estado_usuario.destroy
    respond_to do |format|
      format.html { redirect_to estado_usuarios_url, notice: 'Estado usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_usuario
      @estado_usuario = EstadoUsuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_usuario_params
      params.require(:estado_usuario).permit(:nombre, :descripcion)
    end
end
