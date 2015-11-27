class ProyectosController < ApplicationController
  #layout 'proyectos'
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    authorize! :index, Proyecto
    #Se buscan los proyectos existentes
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    authorize! :show, Proyecto
  end

  # GET /proyectos/new
  def new
    authorize! :new, Proyecto
    @proyecto = Proyecto.new

    #Se cargan los TipoProyecto existentes para poder visualizarlos en la view
    @tipoProyectos = TipoProyecto.all

    #Se cargan los EstadosProyectos que son posibles para estado 'Creado'
    @estadosPosibles = [EstadoProyecto.find_by(nombre: 'Creado')]

  end

  # GET /proyectos/1/edit
  def edit
    authorize! :edit, Proyecto
    
    #Se cargan los TipoProyecto existentes para poder visualizarlos en la view
    @tipoProyectos = TipoProyecto.all
  
    #Se renderiza el modal de 'edit' mediante js 


  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    authorize! :create, Proyecto
   



    #Se hacen un new con los parámetros recibidos
    @proyecto = Proyecto.new(proyecto_params)

    #Se cargan los TipoProyecto existentes para poder visualizarlos en la view
    @tipoProyectos = TipoProyecto.all

    #Se cargan los EstadosProyectos que son posibles para estado 'Creado'
    @estadosPosibles = [EstadoProyecto.find_by(nombre: 'Creado')]
    @coordinador_rol = Rol.find_by(nombre: "Coordinador")


    #Se crea un HistorialEstadoProyecto con el Estado 'Creado'.
    @proyecto.historial_estado_proyectos.new(estado_proyecto_id: EstadoProyecto.find_by(nombre: 'Creado').id, proyecto_id: @proyecto.id)

    #Se renderiza según el formato 'html' o 'js' las respectivas vistas según los casos de éxito y fracaso.
    respond_to do |format|
      if @proyecto.save
        @coordinador = AsignacionRol.new(rol: @coordinador_rol, usuario: current_usuario, proyecto: @proyecto, active: true, esActual: true)
        @coordinador.save
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Creación del Proyecto:' + @proyecto.nombre ,
		    sesion_id: sesion.id ,
		    proyecto_id: @proyecto.id)
        format.html { redirect_to @proyecto
flash[:success] = 'Proyecto fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
	      format.json { render json: @proyecto.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    authorize! :update, Proyecto
    #Se cargan los TipoProyecto existentes para poder visualizarlos en la view
    @tipoProyectos = TipoProyecto.all

    #Se cargan los EstadosProyectos que son posibles para estado 'Creado'
    @estadosPosibles = [EstadoProyecto.find_by(nombre: 'Creado')]

    #Se renderiza según el formato 'html' o 'js' las respectivas vistas según los casos de éxito y fracaso.
    respond_to do |format|
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Edición del Proyecto:' + @proyecto.nombre ,
		    sesion_id: sesion.id ,
		    proyecto_id: @proyecto.id)
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto
         flash[:success] = 'Proyecto fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @proyecto }
        format.js   { render partial: 'proyecto_show', content_type: 'text/html' }
      else
        #format.js {render partial: 'edit_form'}
        format.js { render partial: 'edit', status: :unprocessable_entity }
        format.html { render 'edit'}
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    authorize! :destroy, Proyecto
            sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
            Transaccion.create!(
		    descripcion: 'Borrado del Proyecto:' + @proyecto.nombre ,
		    sesion_id: sesion.id ,
		    proyecto_id: @proyecto.id)
    @proyecto.destroy

    #Se renderiza según el formato 'html' o 'js' las respectivas vistas según los casos de éxito y fracaso.
    respond_to do |format|
      format.html { redirect_to proyectos_url
flash[:success] = 'Proyecto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def mis_proyectos
    authorize! :mis_proyectos, Proyecto

    #Se obtienen los proyectos en los cuales el usuario actual se encuentra participando
    @proyectos = Proyecto.participando(current_usuario)
  end

  def agregar_necesidad
	  authorize! :agregar_necesidad, Proyecto

	  #Se setea el proyecto actual con el parametro :id que recibe
	  set_proyecto 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:id, :nombre, :breveDescripcion, :fechaInicio, :fechaFin, :antecedentes, :justificacionProyecto, :cantidadBeneficiariosDirectos, :cantidadBeneficiariosIndirectos, :justificacionImpacto, :localizacionGeografica, :tipo_proyecto_id, :necesidad_id, historial_estado_proyectos_attributes:[:id, :estado_proyecto_id], asignacion_roles_attributes:[:id, :usuario_id, :rol_id], organizacion_externa_attributes:[:id, :denominacion, :sigla, :cuit, :fax, :telefono, :direccion, :cargoResponsable, :numeroContactoResponsable, :nombreResponsable])
    end
end
