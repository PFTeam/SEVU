class PrivilegiosController < ApplicationController
  before_action :set_privilegio, only: [:show, :edit, :update, :destroy]

  # GET /privilegios
  # GET /privilegios.json
  def index
		authorize! :index, Privilegio
    @privilegios = Privilegio.all
		@tipos = []
		@privilegios.each do |privilegio| 
			@tipos << TipoPrivilegio.find(privilegio.tipo_privilegio_id).nombre
	end

  end

  # GET /privilegios/1
  # GET /privilegios/1.json
  def show
		authorize! :show, Privilegio
  end

  # GET /privilegios/new
  def new
		authorize! :new, Privilegio
    @privilegio = Privilegio.new
  end

  # GET /privilegios/1/edit
  def edit
		authorize! :edit, Privilegio
  end

  # POST /privilegios
  # POST /privilegios.json
  def create
		authorize! :create, Privilegio
    @privilegio = Privilegio.new(privilegio_params)

    respond_to do |format|
      if @privilegio.save
						sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Crear el privilegio  '+@privilegio.nombre,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @privilegio, notice: 'Privilegio fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @privilegio }
      else
        format.html { render :new }
        format.json { render json: @privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privilegios/1
  # PATCH/PUT /privilegios/1.json
  def update
		authorize! :update, Privilegio
    respond_to do |format|
      if @privilegio.update(privilegio_params)
						sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Actualizar el privilegio  '+@privilegio.nombre,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @privilegio, notice: 'Privilegio fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @privilegio }
      else
        format.html { render :edit }
        format.json { render json: @privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privilegios/1
  # DELETE /privilegios/1.json
  def destroy
		authorize! :destroy, Privilegio
		sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Eliminar el privilegio  '+@privilegio.nombre,
    				sesion_id: sesion.id
				)
    @privilegio.destroy
    respond_to do |format|
      format.html { redirect_to privilegios_url, notice: 'Privilegio fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilegio
      @privilegio = Privilegio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privilegio_params
      params.require(:privilegio).permit(:nombre, :descripcion, :tipo_privilegio_id)
    end
end
