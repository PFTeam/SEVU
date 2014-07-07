class EstadoProyectosController < ApplicationController
  before_action :set_estado_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /estado_proyectos
  # GET /estado_proyectos.json
  def index
    @estado_proyectos = EstadoProyecto.all
  end

  # GET /estado_proyectos/1
  # GET /estado_proyectos/1.json
  def show
  end

  # GET /estado_proyectos/new
  def new
    @estado_proyecto = EstadoProyecto.new
  end

  # GET /estado_proyectos/1/edit
  def edit
  end

  # POST /estado_proyectos
  # POST /estado_proyectos.json
  def create
    @estado_proyecto = EstadoProyecto.new(estado_proyecto_params)

    respond_to do |format|
      if @estado_proyecto.save
        format.html { redirect_to @estado_proyecto, notice: 'Estado proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @estado_proyecto }
      else
        format.html { render :new }
        format.json { render json: @estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_proyectos/1
  # PATCH/PUT /estado_proyectos/1.json
  def update
    respond_to do |format|
      if @estado_proyecto.update(estado_proyecto_params)
        format.html { redirect_to @estado_proyecto, notice: 'Estado proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @estado_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_proyectos/1
  # DELETE /estado_proyectos/1.json
  def destroy
    @estado_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to estado_proyectos_url, notice: 'Estado proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_proyecto
      @estado_proyecto = EstadoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_proyecto_params
      params.require(:estado_proyecto).permit(:nombre)
    end
end
