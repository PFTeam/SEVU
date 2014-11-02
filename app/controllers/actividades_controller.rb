class ActividadesController < ApplicationController
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]

  # GET /actividades
  # GET /actividades.json
  def index
		authorize! :index, Actividad
    @actividades = Actividad.all
    @proyecto = @actividades.last.proyecto
  end

  # GET /actividades/1
  # GET /actividades/1.json
  def show
		authorize! :show, Actividad
    @proyecto = @actividad.proyecto
  end

  # GET /actividades/new
  def new
		authorize! :new, Actividad
    @actividad = Actividad.new(:objetivo_especifico_id => params[:objetivo_especifico_id])
    @proyecto = @actividad.objetivo_especifico.objetivo_general.proyecto
    @habilidades = Habilidad.all
    @tipoActividades = TipoActividad.all
    @actividad.requisitos.build
  end

  # GET /actividades/1/edit
  def edit
		authorize! :edit, Actividad
    @proyecto = @actividad.objetivo_especifico.objetivo_general.proyecto
    @habilidades = Habilidad.all
    @tipoActividades = TipoActividad.all
  end

  # POST /actividades
  # POST /actividades.json
  def create
		authorize! :create, Actividad
    @actividad = Actividad.new(actividad_params)
    @actividad.historial_estado_actividades.new(estado_actividad_id: EstadoActividad.find_by(nombre: 'Creada').id, actividad_id: @actividad.id)

    respond_to do |format|
      if @actividad.save
	      format.html { redirect_to @actividad,:objetivo_especifico_id => @actividad.objetivo_especifico_id 
		     flash[:notice] = 'Actividad fue creado satisfactoriamente.'  }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { render :new, :objetivo_especifico_id => @actividad.objetivo_especifico_id }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1
  # PATCH/PUT /actividades/1.json
  def update
		authorize! :update, Actividad
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to @actividad, notice: 'Actividad fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.json
  def destroy
		authorize! :destroy, Actividad
    @actividad.destroy
    respond_to do |format|
      format.html { redirect_to actividades_url, notice: 'Actividad fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def agregar_habilidad
		authorize! :agregar_habilidad, Actividad
     @habilidad = Habilidad.new
     respond_to do |format|
	format.js {render partial: 'requisitos', content_type: 'text/html', :locals => {:f => params[:f]}}
	format.json {render partial: 'requisitos', content_type: 'text/html', :locals => {:f => params[:f]}}
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_params
      params.require(:actividad).permit(:nombre, :descripcion, :duracion, :duracionReal, :fechaEstimadaInicio, :fechaRealInicio, :estrategiasIntervencion, :metodologiasIntervencion, :mecanismoEvaluacion, :resultadosEsperados, :objetivo_especifico_id, :proyecto_id, :tipo_actividad_id, requisitos_attributes:  [:id, :actividad_id, :habilidad_id])
    end

end
