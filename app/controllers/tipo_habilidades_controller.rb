class TipoHabilidadesController < ApplicationController
  before_action :set_tipo_habilidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_habilidades
  # GET /tipo_habilidades.json
  def index
		authorize! :index, TipoHabilidad
    @tipo_habilidades = TipoHabilidad.all
  end

  # GET /tipo_habilidades/1
  # GET /tipo_habilidades/1.json
  def show
		authorize! :show, TipoHabilidad
  end

  # GET /tipo_habilidades/new
  def new
		authorize! :new, TipoHabilidad
    @tipo_habilidad = TipoHabilidad.new
  end

  # GET /tipo_habilidades/1/edit
  def edit
		authorize! :edit, TipoHabilidad
  end

  # POST /tipo_habilidades
  # POST /tipo_habilidades.json
  def create
		authorize! :create, TipoHabilidad
    @tipo_habilidad = TipoHabilidad.new(tipo_habilidad_params)

    respond_to do |format|
      if @tipo_habilidad.save
        format.html { redirect_to gestionar_habilidades_path }
        #format.html { redirect_to @tipo_habilidad, notice: 'Tipo habilidad fue creado satisfactoriamente.' }
        #format.json { render :show, status: :created, location: @tipo_habilidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_habilidades/1
  # PATCH/PUT /tipo_habilidades/1.json
  def update
		authorize! :update, TipoHabilidad
    respond_to do |format|
      if @tipo_habilidad.update(tipo_habilidad_params)
        format.html { redirect_to gestionar_habilidades_path }
        #format.html { redirect_to @tipo_habilidad, notice: 'Tipo habilidad fue actualizado satisfactoriamente.' }
        #format.json { render :show, status: :ok, location: @tipo_habilidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_habilidades/1
  # DELETE /tipo_habilidades/1.json
  def destroy
		authorize! :destroy, TipoHabilidad
    
    #if !tipo_habilidad.habilidades.nil? then # Pregunto si tiene habilidades asociadas
      #@tipo_habilidad.habilidades.each do |habilidad|
        
        #habilidad.destroy #elimino cada habilidad asociada
      #end
    #end

    @tipo_habilidad.destroy
    respond_to do |format|
      format.html { redirect_to gestionar_habilidades_path } #tipo_habilidades_url, notice: 'Tipo habilidad fue borrado satisfactoriamente.' }
      format.json { render json: @tipo_habilidad.errors, status: :unprocessable_entity }
      #format.json { head :no_content }
    end
  end
  
  def gestionar_habilidades
		authorize! :gestionar_habilidades, TipoHabilidad
    @tipos_habilidades = TipoHabilidad.all
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
