class HabilidadesController < ApplicationController

  before_action :set_habilidad, only: [:show, :edit, :update, :destroy]
  before_action :set_tipo_habilidad, only: [:new, :create]
  # GET /habilidades
  # GET /habilidades.json
  def index
		authorize! :index, Habilidad
    @habilidades = Habilidad.all
  end

  # GET /habilidades/1
  # GET /habilidades/1.json
  def show
		authorize! :show, Habilidad
  end

  # GET /habilidades/new
  def new
		authorize! :new, Habilidad
    @habilidad = Habilidad.new
  end

  # GET /habilidades/1/edit
  def edit
		authorize! :edit, Habilidad
  end

  # POST /habilidades
  # POST /habilidades.json
  def create
		authorize! :create, Habilidad
    #@habilidad = Habilidad.new(habilidad_params)
    @habilidad = @tipo_habilidad.habilidades.new(habilidad_params)
    respond_to do |format|
      if @habilidad.save
        format.html { redirect_to gestionar_habilidades_path }
        #format.html { redirect_to @habilidad, notice: 'Habilidad was successfully created.' }
        #format.json { render :show, status: :created, location: @habilidad }
      else
        format.html { render :new }
        format.json { render json: @habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habilidades/1
  # PATCH/PUT /habilidades/1.json
  def update
		authorize! :update, Habilidad
    respond_to do |format|
      if @habilidad.update(habilidad_params)
        format.html { redirect_to gestionar_habilidades_path }
        #format.html { redirect_to @habilidad, notice: 'Habilidad was successfully updated.' }
        #format.json { render :show, status: :ok, location: @habilidad }
      else
        format.html { render :edit }
        format.json { render json: @habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habilidades/1
  # DELETE /habilidades/1.json
  def destroy
		authorize! :destroy, Habilidad
    #@habilidad.destroy
    respond_to do |format|
      if @habilidad.destroy
        format.html { redirect_to gestionar_habilidades_path }
      #format.json { render json: @habilidad.errors, status: :unprocessable_entity }      
      #format.html { redirect_to habilidades_url, notice: 'Habilidad was successfully destroyed.' }
        format.json { head :no_content }
      else
#        format.html { redirect_to gestionar_habilidades_path, alert: 'La habilidad no puede ser eliminada porque existen usuarios que la utilizan'}
        format.html { redirect_to :back, alert: 'La habilidad no puede ser eliminada porque existen usuarios que la utilizan'}        
        #format.json { render json: @habilidad.errors, status: :unprocessable_entity }
        #flash[:error] = @habilidad.errors.full_messages.join(' errorrrr')
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_tipo_habilidad
      @tipo_habilidad = TipoHabilidad.find params[:tipo_habilidad_id]
    end

    def set_habilidad
      @habilidad = Habilidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habilidad_params
      params.require(:habilidad).permit(:nombre, :descripcion, :tipo_habilidad_id)
    end
end
