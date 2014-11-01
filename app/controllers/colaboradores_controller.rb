class ColaboradoresController < ApplicationController
  before_action :set_colaborador, only: [:show, :edit, :update, :destroy]

  # GET /colaboradores
  # GET /colaboradores.json
  def index
		authorize! :index, Colaborador
    @colaboradores = Colaborador.all
  end

  # GET /colaboradores/1
  # GET /colaboradores/1.json
  def show
		authorize! :show, Colaborador
  end

  # GET /colaboradores/new
  def new
		authorize! :new, Colaborador
    @organizacionesExternas = OrganizacionExterna.all
    @proyecto = Proyecto.find(params[:proyecto_id])
    @colaboradores = Colaborador.all.where(proyecto: @proyecto)
    @colaborador = Colaborador.new
  end

  # GET /colaboradores/1/edit
  def edit
		authorize! :edit, Colaborador
  end

  # POST /colaboradores
  # POST /colaboradores.json
  def create
		authorize! :create, Colaborador
    @colaborador = Colaborador.new(colaborador_params)

    respond_to do |format|
      if @colaborador.save
        format.js { render 'show', notice: 'El Colaborador fue agregado satisfactoriamente', content_type: 'text/html' }
	format.html { redirect_to :action => 'new', :proyecto_id => @colaborador.proyecto_id
		      flash[:notice] =  'Colaborador fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @colaborador }
      else
        format.html { render :new }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaboradores/1
  # PATCH/PUT /colaboradores/1.json
  def update
		authorize! :update, Colaborador
    respond_to do |format|
      if @colaborador.update(colaborador_params)
        format.html { redirect_to @colaborador, notice: 'Colaborador fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @colaborador }
      else
        format.html { render :edit }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradores/1
  # DELETE /colaboradores/1.json
  def destroy

		authorize! :destroy, Colaborador

    @proyecto_id = @colaborador.proyecto_id

    @colaborador.destroy
    respond_to do |format|
	format.html { redirect_to :action => 'new', :proyecto_id => @proyecto_id
		      flash[:notice] =  'Colaborador fue borrado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @colaborador }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborador
      @colaborador = Colaborador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colaborador_params
      params.require(:colaborador).permit(:organizacion_externa_id, :proyecto_id )
    end
end
