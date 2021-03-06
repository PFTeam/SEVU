class AsignacionRolPredefinidosController < ApplicationController
  before_action :set_asignacion_rol_predefinido, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_rol_predefinidos
  # GET /asignacion_rol_predefinidos.json
  def index
		authorize! :index, AsignacionRolPredefinido
    @asignacion_rol_predefinidos = AsignacionRolPredefinido.all
		@rol_priv = []
		@asignacion_rol_predefinidos.each do |asignacion_rol_predefinido|
			@rol_priv << {
        rol: Rol.find(asignacion_rol_predefinido.rol).nombre,
        privilegio: Privilegio.find(asignacion_rol_predefinido.privilegio).nombre
      		}
		end

  end

  # GET /asignacion_rol_predefinidos/1
  # GET /asignacion_rol_predefinidos/1.json
  def show
		authorize! :show, AsignacionRolPredefinido
  end

  # GET /asignacion_rol_predefinidos/new
  def new
		authorize! :new, AsignacionRolPredefinido
    @asignacion_rol_predefinido = AsignacionRolPredefinido.new
  end

  # GET /asignacion_rol_predefinidos/1/edit
  def edit
		authorize! :edit, AsignacionRolPredefinido
  end

  # POST /asignacion_rol_predefinidos
  # POST /asignacion_rol_predefinidos.json
  def create
		authorize! :create, AsignacionRolPredefinido
    @asignacion_rol_predefinido = AsignacionRolPredefinido.new(asignacion_rol_predefinido_params)

    respond_to do |format|
									
				
      if @asignacion_rol_predefinido.save
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Creación asociación rol #{@asignacion_rol_predefinido.rol.nombre} al privilegio #{@asignacion_rol_predefinido.privilegio.nombre}: actual = #{ t @asignacion_rol_predefinido.esActual.to_s}",
    				sesion_id: sesion.id
				)
        format.html { redirect_to @asignacion_rol_predefinido, notice: 'Asignacion rol predefinido fue creado satisfactoriamente.' }
        format.html { redirect_to @asignacion_rol_predefinido
          flash[:success] = 'Asignacion rol predefinido fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @asignacion_rol_predefinido }
      else
        format.html { render :new }
        format.json { render json: @asignacion_rol_predefinido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_rol_predefinidos/1
  # PATCH/PUT /asignacion_rol_predefinidos/1.json
  def update
		authorize! :update, AsignacionRolPredefinido
    respond_to do |format|
      if @asignacion_rol_predefinido.update(asignacion_rol_predefinido_params)
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Actualizar asociación rol #{@asignacion_rol_predefinido.rol.nombre} al privilegio #{@asignacion_rol_predefinido.privilegio.nombre}: actual = #{ t @asignacion_rol_predefinido.esActual.to_s}",
    				sesion_id: sesion.id
				)
        format.html { redirect_to @asignacion_rol_predefinido
         flash[:success] = 'Asignacion rol predefinido fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @asignacion_rol_predefinido }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_rol_predefinido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_rol_predefinidos/1
  # DELETE /asignacion_rol_predefinidos/1.json
  def destroy
		authorize! :destroy, AsignacionRolPredefinido
		sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Eliminar asociación rol #{@asignacion_rol_predefinido.rol.nombre} al privilegio #{@asignacion_rol_predefinido.privilegio.nombre}: actual = #{ t @asignacion_rol_predefinido.esActual.to_s}",
    				sesion_id: sesion.id
				)

    @asignacion_rol_predefinido.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_rol_predefinidos_url
      flash[:success] = 'Asignacion rol predefinido fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_rol_predefinido
      @asignacion_rol_predefinido = AsignacionRolPredefinido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_rol_predefinido_params
      params.require(:asignacion_rol_predefinido).permit(:esActual, :privilegio_id, :rol_id)
    end
end
