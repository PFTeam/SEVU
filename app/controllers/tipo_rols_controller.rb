class TipoRolsController < ApplicationController
  before_action :set_tipo_rol, only: [:show, :edit, :update, :destroy]

  # GET /tipo_rols
  # GET /tipo_rols.json
  def index
    @tipo_rols = TipoRol.all
  end

  # GET /tipo_rols/1
  # GET /tipo_rols/1.json
  def show
  end

  # GET /tipo_rols/new
  def new
    @tipo_rol = TipoRol.new
  end

  # GET /tipo_rols/1/edit
  def edit
  end

  # POST /tipo_rols
  # POST /tipo_rols.json
  def create
    @tipo_rol = TipoRol.new(tipo_rol_params)

    respond_to do |format|
      if @tipo_rol.save
        format.html { redirect_to @tipo_rol, notice: 'Tipo rol was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_rol }
      else
        format.html { render :new }
        format.json { render json: @tipo_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_rols/1
  # PATCH/PUT /tipo_rols/1.json
  def update
    respond_to do |format|
      if @tipo_rol.update(tipo_rol_params)
        format.html { redirect_to @tipo_rol, notice: 'Tipo rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_rol }
      else
        format.html { render :edit }
        format.json { render json: @tipo_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_rols/1
  # DELETE /tipo_rols/1.json
  def destroy
    @tipo_rol.destroy
    respond_to do |format|
      format.html { redirect_to tipo_rols_url, notice: 'Tipo rol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_rol
      @tipo_rol = TipoRol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_rol_params
      params.require(:tipo_rol).permit(:nombre, :descripcion)
    end
end
