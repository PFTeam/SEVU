class TipoProyectosController < ApplicationController
  before_action :set_tipo_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /tipo_proyectos
  # GET /tipo_proyectos.json
  def index
		authorize! :index, TipoProyecto
    @tipo_proyectos = TipoProyecto.all
  end

  # GET /tipo_proyectos/1
  # GET /tipo_proyectos/1.json
  def show
		authorize! :show, TipoProyecto
  end

  # GET /tipo_proyectos/new
  def new
		authorize! :new, TipoProyecto
    @tipo_proyecto = TipoProyecto.new
  end

  # GET /tipo_proyectos/1/edit
  def edit
		authorize! :edit, TipoProyecto
  end

  # POST /tipo_proyectos
  # POST /tipo_proyectos.json
  def create
		authorize! :create, TipoProyecto
    @tipo_proyecto = TipoProyecto.new(tipo_proyecto_params)

    respond_to do |format|
      if @tipo_proyecto.save
        format.html { redirect_to @tipo_proyecto, notice: 'Tipo proyecto fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @tipo_proyecto }
      else
        format.html { render :new }
        format.json { render json: @tipo_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_proyectos/1
  # PATCH/PUT /tipo_proyectos/1.json
  def update
		authorize! :update, TipoProyecto
    respond_to do |format|
      if @tipo_proyecto.update(tipo_proyecto_params)
        format.html { redirect_to @tipo_proyecto, notice: 'Tipo proyecto fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @tipo_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_proyectos/1
  # DELETE /tipo_proyectos/1.json
  def destroy
		authorize! :destroy, TipoProyecto
    @tipo_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_proyectos_url, notice: 'Tipo proyecto fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_proyecto
      @tipo_proyecto = TipoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_proyecto_params
      params.require(:tipo_proyecto).permit(:nombre, :descripcion)
    end
end
