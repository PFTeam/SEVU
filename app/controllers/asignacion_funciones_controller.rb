class AsignacionFuncionesController < ApplicationController
  before_action :set_asignacion_funcion, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_funciones
  # GET /asignacion_funciones.json
  def index
		authorize! :index, AsignacionFuncion
    @asignacion_funciones = AsignacionFuncion.all
		@usuario_rol = []
		@asignacion_funciones.each do |asignacion_funcion|
			if asignacion_funcion.usuario !=nil
				user=Usuario.find(asignacion_funcion.usuario_id).nombreUsuario
			else 
				user = '-'
			end
			@usuario_rol << {
        usuario: user ,
        rol: Rol.find(asignacion_funcion.rol_id).nombre
      		}
		end
  end

  # GET /asignacion_funciones/1
  # GET /asignacion_funciones/1.json
  def show
		authorize! :show, AsignacionFuncion
  end

  # GET /asignacion_funciones/new
  def new
		authorize! :new, AsignacionFuncion
    @asignacion_funcion = AsignacionFuncion.new
		@roles = Rol.where(tipo_rol: TipoRol.where(nombre:'Sistema'))
  end

  # GET /asignacion_funciones/1/edit
  def edit
		authorize! :edit, AsignacionFuncion
		@roles = Rol.where(tipo_rol: TipoRol.where(nombre:'Sistema'))
  end

  # POST /asignacion_funciones
  # POST /asignacion_funciones.json
  def create
		authorize! :create, AsignacionFuncion
    @asignacion_funcion = AsignacionFuncion.new(asignacion_funcion_params)

    respond_to do |format|
      if @asignacion_funcion.save
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Asignar el rol '+Rol.find(@asignacion_funcion.rol_id).nombre + ' al usuario ' + Usuario.find(@asignacion_funcion.usuario_id).nombreUsuario,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @asignacion_funcion
          flash[:success] = 'Asignacion funcion fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @asignacion_funcion }
      else
        format.html { render :new }
        format.json { render json: @asignacion_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_funciones/1
  # PATCH/PUT /asignacion_funciones/1.json
  def update
		authorize! :update, AsignacionFuncion
    respond_to do |format|
      if @asignacion_funcion.update(asignacion_funcion_params)
						sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Actualizar el rol '+Rol.find(@asignacion_funcion.rol_id).nombre + ' al usuario ' + Usuario.find(@asignacion_funcion.usuario_id).nombreUsuario,
    				sesion_id: sesion.id
				)
        format.html { redirect_to @asignacion_funcion
          flash[:success] = 'Asignacion funcion fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @asignacion_funcion }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_funciones/1
  # DELETE /asignacion_funciones/1.json
  def destroy
		authorize! :destroy, AsignacionFuncion
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: 'Eliminar la asignación del rol '+Rol.find(@asignacion_funcion.rol_id).nombre + ' al usuario ' + Usuario.find(@asignacion_funcion.usuario_id).nombreUsuario,
    				sesion_id: sesion.id
				)
    @asignacion_funcion.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_funciones_url
        flash[:success] = 'Asignacion funcion fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_funcion
      @asignacion_funcion = AsignacionFuncion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_funcion_params
      params.require(:asignacion_funcion).permit(:esActual, :descripcion, :usuario_id, :rol_id)
    end
end
