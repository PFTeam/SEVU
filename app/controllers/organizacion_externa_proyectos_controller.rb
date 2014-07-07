class OrganizacionExternaProyectosController < ApplicationController
  before_action :set_organizacion_externa_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /organizacion_externa_proyectos
  # GET /organizacion_externa_proyectos.json
  def index
    @organizacion_externa_proyectos = OrganizacionExternaProyecto.all
  end

  # GET /organizacion_externa_proyectos/1
  # GET /organizacion_externa_proyectos/1.json
  def show
  end

  # GET /organizacion_externa_proyectos/new
  def new
    @organizacion_externa_proyecto = OrganizacionExternaProyecto.new
  end

  # GET /organizacion_externa_proyectos/1/edit
  def edit
  end

  # POST /organizacion_externa_proyectos
  # POST /organizacion_externa_proyectos.json
  def create
    @organizacion_externa_proyecto = OrganizacionExternaProyecto.new(organizacion_externa_proyecto_params)

    respond_to do |format|
      if @organizacion_externa_proyecto.save
        format.html { redirect_to @organizacion_externa_proyecto, notice: 'Organizacion externa proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @organizacion_externa_proyecto }
      else
        format.html { render :new }
        format.json { render json: @organizacion_externa_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizacion_externa_proyectos/1
  # PATCH/PUT /organizacion_externa_proyectos/1.json
  def update
    respond_to do |format|
      if @organizacion_externa_proyecto.update(organizacion_externa_proyecto_params)
        format.html { redirect_to @organizacion_externa_proyecto, notice: 'Organizacion externa proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @organizacion_externa_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @organizacion_externa_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizacion_externa_proyectos/1
  # DELETE /organizacion_externa_proyectos/1.json
  def destroy
    @organizacion_externa_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to organizacion_externa_proyectos_url, notice: 'Organizacion externa proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizacion_externa_proyecto
      @organizacion_externa_proyecto = OrganizacionExternaProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizacion_externa_proyecto_params
      params.require(:organizacion_externa_proyecto).permit(:organizacion_externa_id, :proyecto_id)
    end
end
