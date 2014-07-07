class TipoHabilidadsController < ApplicationController
  before_action :set_tipo_habilidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_habilidads
  # GET /tipo_habilidads.json
  def index
    @tipo_habilidads = TipoHabilidad.all
  end

  # GET /tipo_habilidads/1
  # GET /tipo_habilidads/1.json
  def show
  end

  # GET /tipo_habilidads/new
  def new
    @tipo_habilidad = TipoHabilidad.new
  end

  # GET /tipo_habilidads/1/edit
  def edit
  end

  # POST /tipo_habilidads
  # POST /tipo_habilidads.json
  def create
    @tipo_habilidad = TipoHabilidad.new(tipo_habilidad_params)

    respond_to do |format|
      if @tipo_habilidad.save
        format.html { redirect_to @tipo_habilidad, notice: 'Tipo habilidad was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_habilidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_habilidads/1
  # PATCH/PUT /tipo_habilidads/1.json
  def update
    respond_to do |format|
      if @tipo_habilidad.update(tipo_habilidad_params)
        format.html { redirect_to @tipo_habilidad, notice: 'Tipo habilidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_habilidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_habilidads/1
  # DELETE /tipo_habilidads/1.json
  def destroy
    @tipo_habilidad.destroy
    respond_to do |format|
      format.html { redirect_to tipo_habilidads_url, notice: 'Tipo habilidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_habilidad
      @tipo_habilidad = TipoHabilidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_habilidad_params
      params.require(:tipo_habilidad).permit(:nombre, :descripcion)
    end
end
