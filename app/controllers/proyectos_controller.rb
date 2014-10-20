class ProyectosController < ApplicationController
  #layout 'proyectos'
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    #@proyectos = Proyecto.activos
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @tipoProyectos = TipoProyecto.all

    #TODO: En vez de esto, que sea por autocompletado
    @usuarios = Usuario.all

    @estadosPosibles = [EstadoProyecto.find_by(nombre: 'Creado')]


    if @proyecto.necesidad_id.nil?
      @necesidades = Necesidad.all
    else
      @necesidades = @proyecto.necesidad
      @beneficiario = @proyecto.necesidad.usuario
    end

    @proyecto.asignacion_roles.build
    @proyecto.historial_estado_proyectos.build
    @proyecto.organizacion_externas.build
  end

  # GET /proyectos/1/edit
  def edit

    @tipoProyectos = TipoProyecto.all
    @necesidades = Necesidad.all
    @usuarios = Usuario.all
    @tipoProyectos = TipoProyecto.all
   # if @proyecto.historial_estado_proyectos.last.nil?
    #  @estadosPosibles = EstadoProyecto.estados_posibles @proyecto.historial_estado_proyectos.last.estado_proyecto
   # end
      #@beneficiario = @proyecto.necesidad.usuario
    respond_to do |format|
      format.js {render partial: 'edit', content_type: 'text/html'}
    end

   
   # @proyecto.asignacion_roles.build
   # @proyecto.historial_estado_proyectos.build
   # @proyecto.organizacion_externas.build
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)
    #@proyecto.asignacion_roles.first.rol = (Rol.find_by(nombre: 'Director'))


    #TODO: para no crear una organizacion existente. NO FUNCIONA
    @proyecto.colaboradores.each do |colaborador|
      if orgExistente = OrganizacionExterna.find_by(denominacion: colaborador.organizacion_externa.denominacion)
        colaborador.organizacion_externa_id = orgExistente.id
      end
    end
    
    @proyecto.historial_estado_proyectos.new(estado_proyecto_id: EstadoProyecto.find_by(nombre: 'Creado').id, proyecto_id: @proyecto.id)


    #TODO: solucionar lo de abajo para que no diga que tengo proyecto blank
    #@proyecto.historial_estado_proyectos.last.proyecto = @proyecto
    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto }
        format.js   { render partial: 'proyecto_show', content_type: 'text/html' }
      else
        #format.js {render partial: 'edit_form'}
        format.js { render partial: 'edit', status: :unprocessable_entity }
        format.html { render partial: 'edit', status: :unprocessable_entity }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mis_proyectos
    @proyectos = Proyecto.participando(current_usuario)
  end

  def crear_organizacion_externa
   @organizacion_externa = OrganizacionExterna.new
   render partial: 'crear_organizacion_externa', content_type: 'text/html' 
  end

  def agregar_organizacion_externa
    #@proyecto = Proyecto.find(params[:id])
   @colaborador = Colaborador.build(proyecto_id: @proyecto.id)
   render partial: 'agregar_organizacion_externa', content_type: 'text/html' 
  end

  def agregar_necesidad
	  set_proyecto
   render partial: 'agregar_necesidad', content_type: 'text/html' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:nombre, :breveDescripcion, :fechaInicio, :fechaFin, :antecedentes, :justificacionProyecto, :cantidadBeneficiariosDirectos, :cantidadBeneficiariosIndirectos, :justificacionImpacto, :localizacionGeografica, :tipo_proyecto_id, :necesidad_id, historial_estado_proyectos_attributes:[:id, :estado_proyecto_id], asignacion_roles_attributes:[:id, :usuario_id, :rol_id], organizacion_externa_attributes:[:id, :denominacion, :sigla, :cuit, :fax, :telefono, :direccion, :cargoResponsable, :numeroContactoResponsable, :nombreResponsable])
    end
end
