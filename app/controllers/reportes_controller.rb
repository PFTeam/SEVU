class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :edit, :update, :destroy]
# asd
  #
  # GET /reportes
  # GET /reportes.json
  def index
#		authorize! :index, Reporte
	  @asignacion_actividades = AsignacionActividad.find_by(actividad_id: params[:actividad_id])
	  @actividad = @asignacion_actividades.actividad 
    	  @proyecto = @actividad.proyecto
	  @reportes_mios = []
	  @asignacion_actividades.to_a.each do |asignacion|
		if asignacion.usuario == current_usuario && !asignacion.reportes.nil?
			    @reportes_mios = @reportes_mios + asignacion.reportes
	     	end
	  end
	  @reportes_todos = @actividad.reportes

	  @reportes_todos = [] if @reportes_todos.nil?
	  @reportes_mios = [] if @reportes_mios.nil?
	  @reportes_todos = @reportes_todos.uniq
	  @reportes_mios = @reportes_mios.uniq
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show
#		authorize! :show, Reporte
  end

  # GET /reportes/new
  def new
#		authorize! :new, Reporte
    @actividad = Actividad.find(params[:actividad_id])
    @proyecto = @actividad.proyecto
    @asignacion_actividad = @actividad.asignacion_actividades.where('vigente =? and usuario_id =?', 'true' , current_usuario.id).uniq.last
    @asignacion_actividad_id = @asignacion_actividad.id
    @reporte = Reporte.new
  end

  # GET /reportes/1/edit
  def edit
#		authorize! :edit, Reporte
	  #

     @asignacion_actividad = @reporte.asignacion_actividad
  end

  # POST /reportes
  # POST /reportes.json
  def create
#		authorize! :create, Reporte
    @reporte = Reporte.new(reporte_params)

    respond_to do |format|
      if @reporte.save
	      format.html { redirect_to :action => 'index', :actividad_id => @reporte.asignacion_actividad.actividad.id 
		     flash[:notice] = 'Reporte 'fue creado satisfactoriamente'.' }
        format.json { render :show, status: :created, location: @reporte }
      else
        format.html { render :new }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportes/1
  # PATCH/PUT /reportes/1.json
  def update
#		authorize! :update, Reporte
    respond_to do |format|
      if @reporte.update(reporte_params)
        format.html { redirect_to @reporte, notice: 'Reporte 'fue actualizado satisfactoriamente'.' }
        format.json { render :show, status: :ok, location: @reporte }
      else
        format.html { render :edit }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
#		authorize! :destroy, Reporte
    @reporte.destroy
    respond_to do |format|
      format.html { redirect_to reportes_url, notice: 'Reporte 'fue borrado satisfactoriamente'.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte
      @reporte = Reporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_params
      params.require(:reporte).permit(:descripcion, :asignacion_actividad_id)
    end
end
