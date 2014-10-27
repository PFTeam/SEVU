class TipoPrivilegiosController < ApplicationController
  before_action :set_tipo_privilegio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_privilegios
  # GET /tipo_privilegios.json
  def index
		authorize! :index, TipoPrivilegio
    @tipo_privilegios = TipoPrivilegio.all
  end

  # GET /tipo_privilegios/1
  # GET /tipo_privilegios/1.json
  def show
		authorize! :index, TipoPrivilegio
  end

  # GET /tipo_privilegios/new
  def new
		authorize! :new, TipoPrivilegio
    @tipo_privilegio = TipoPrivilegio.new
  end

  # GET /tipo_privilegios/1/edit
  def edit
		authorize! :edit, TipoPrivilegio
  end

  # POST /tipo_privilegios
  # POST /tipo_privilegios.json
  def create
		authorize! :create, TipoPrivilegio
    @tipo_privilegio = TipoPrivilegio.new(tipo_privilegio_params)

    respond_to do |format|
      if @tipo_privilegio.save
        format.html { redirect_to @tipo_privilegio, notice: 'Tipo privilegio was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_privilegio }
      else
        format.html { render :new }
        format.json { render json: @tipo_privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_privilegios/1
  # PATCH/PUT /tipo_privilegios/1.json
  def update
		authorize! :update, TipoPrivilegio
    respond_to do |format|
      if @tipo_privilegio.update(tipo_privilegio_params)
        format.html { redirect_to @tipo_privilegio, notice: 'Tipo privilegio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_privilegio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_privilegios/1
  # DELETE /tipo_privilegios/1.json
  def destroy
		authorize! :destroy, TipoPrivilegio
    @tipo_privilegio.destroy
    respond_to do |format|
      format.html { redirect_to tipo_privilegios_url, notice: 'Tipo privilegio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_privilegio
      @tipo_privilegio = TipoPrivilegio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_privilegio_params
      params.require(:tipo_privilegio).permit(:nombre, :descripcion)
    end
end
