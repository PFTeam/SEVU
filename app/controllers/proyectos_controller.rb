class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.activos

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

    #TODO: pasar solo estados posibles, segun el actual
    @estadosPosibles = EstadoProyecto.all

    unless @proyecto.necesidad_id.nil?
      @necesidades = @proyecto.necesidad
      @beneficiario = Necesidad.find(@proyecto.necesidad_id).usuario
    else
      @necesidades = Necesidad.all
    end

    @proyecto.asignacion_roles.build
    @proyecto.historial_estado_proyectos.build
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)
    @proyecto.asignacion_roles.first.rol = (Rol.find_by(nombre: 'Director'))
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
      else
        format.html { render :edit }
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
    params[:usuario]=Usuario.find(7) #TODO: Obtener usuario real cuando este la sesion implementada
    @proyectos = Proyecto.participando(params[:usuario])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:nombre, :breveDescripcion, :fechaInicio, :fechaFin, :antecedentes, :justificacionProyecto, :cantidadBeneficiariosDirectos, :cantidadBeneficiariosIndirectos, :justificacionImpacto, :localizacionGeografica, :tipo_proyecto_id, :necesidad_id, historial_estado_proyectos_attributes:[:id, :estado_proyecto_id], asignacion_roles_attributes:[:id, :usuario_id, :rol_id])
    end
end
