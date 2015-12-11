class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :edit, :update, :destroy]
# asd
  #
  # GET /reportes
  # GET /reportes.json
  def index
		authorize! :index, Reporte
	  @asignacion_actividades = AsignacionActividad.where(actividad_id: params[:actividad_id]).to_a
	  p @asignacion_actividades
	  @actividad = Actividad.find(params[:actividad_id])
	  if @asignacion_actividades.size > 0
		  @proyecto = @actividad.proyecto
		  @reportes_mios = []
		  p @reportes_mios
		  @asignacion_actividades.to_a.each do |asignacion|
			if asignacion.usuario == current_usuario && !asignacion.reportes.nil?
				    @reportes_mios = @reportes_mios + asignacion.reportes
					  p @reportes_mios
			end
		  end
		  @reportes_todos = @actividad.reportes

		  @reportes_todos = [] if @reportes_todos.nil?
		  @reportes_mios = [] if @reportes_mios.nil?
		  @reportes_todos = @reportes_todos.uniq
		  @reportes_mios = @reportes_mios.uniq
	  end
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @reporte.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @reporte.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !Reporte.accessible_by(current_ability, :show).include?(@reporte)
		else
			authorize! :show, Reporte
		end

  end

  # GET /reportes/new
  def new
		
    @actividad = Actividad.find(params[:actividad_id])
    @proyecto = @actividad.proyecto


			authorize! :new, Reporte

    @asignacion_actividad = @actividad.asignacion_actividades.where('vigente =? and usuario_id =?', 'true' , current_usuario.id).uniq.last
    @asignacion_actividad_id = @asignacion_actividad.id
    @reporte = Reporte.new
		
  end

  # GET /reportes/1/edit
  def edit
		authorize! :edit, Reporte
	  #

     @asignacion_actividad = @reporte.asignacion_actividad
  end

  # POST /reportes
  # POST /reportes.json
  def create
		
    @reporte = Reporte.new(reporte_params)
		@asignacion_actividad = @reporte.asignacion_actividad
    @actividad = @asignacion_actividad.actividad
    @proyecto = @actividad.proyecto

			authorize! :create, Reporte

    
    respond_to do |format|
      if @reporte.save
	      format.html { redirect_to :action => 'index', :actividad_id => @reporte.asignacion_actividad.actividad.id 
		     flash[:success] = 'Reporte fue creado satisfactoriamente.' }
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
		raise CanCan::AccessDenied if !Reporte.accessible_by(current_ability, :update).include?(@reporte)
    @asignacion_actividad = @reporte.asignacion_actividad
    @actividad = @asignacion_actividad.actividad
    @proyecto = @actividad.proyecto
    respond_to do |format|
      if @reporte.update(reporte_params)
        format.html { redirect_to @reporte
flash[:success] = 'Reporte fue actualizado satisfactoriamente.' }
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
		raise CanCan::AccessDenied if !Reporte.accessible_by(current_ability, :destroy).include?(@reporte)
    @reporte.destroy
    respond_to do |format|
      format.html { redirect_to reportes_url
flash[:success] = 'Reporte fue borrado satisfactoriamente.' }
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
