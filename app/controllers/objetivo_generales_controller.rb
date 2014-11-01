class ObjetivoGeneralesController < ApplicationController
  before_action :set_objetivo_general, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_generales
  # GET /objetivo_generales.json
  def index
		authorize! :index, ObjetivoGeneral
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /objetivo_generales/1
  # GET /objetivo_generales/1.json
  def show
		authorize! :show, ObjetivoGeneral
    @proyecto = Proyecto.find(@objetivo_general.proyecto.id)
  end

  # GET /objetivo_generales/new
  def new
		authorize! :new, ObjetivoGeneral
    @proyecto = Proyecto.find(params[:proyecto_id])
    @objetivo_general = ObjetivoGeneral.new
  end

  # GET /objetivo_generales/1/edit
  def edit
		authorize! :edit, ObjetivoGeneral
    respond_to do |format|
      format.js {render partial: 'edit', content_type: 'text/html' }
    end
  end

  # POST /objetivo_generales
  # POST /objetivo_generales.json
  def create
		authorize! :create, ObjetivoGeneral
    @objetivo_general = ObjetivoGeneral.new(objetivo_general_params)
    p @objetivo_general.proyecto_id
    respond_to do |format|
      if @objetivo_general.save
	format.html {redirect_to :controller => 'objetivo_generales', :action => 'index',:proyecto_id => @objetivo_general.proyecto_id
	      flash[:notice] = 'Objetivo general creado.' } 
        format.json { render :show, status: :created, location: @objetivo_general }
      else
        format.html { render :new }
        format.json { render json: @objetivo_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_generales/1
  # PATCH/PUT /objetivo_generales/1.json
  def update
		authorize! :update, ObjetivoGeneral
    respond_to do |format|
      if @objetivo_general.update(objetivo_general_params)
        format.html { redirect_to @objetivo_general, notice: 'Objetivo general fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @objetivo_general }
        format.js   { render :show, content_type: 'text/html' }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_generales/1
  # DELETE /objetivo_generales/1.json
  def destroy
		authorize! :destroy, ObjetivoGeneral
    @proyecto = @objetivo_general.proyecto
    p @proyecto.id
    @objetivo_general.destroy
    respond_to do |format|
	    format.html { redirect_to objetivo_generales_path(:proyecto_id => @proyecto.id)
		    flash[:notice] = 'Objetivo general fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_general
      @objetivo_general = ObjetivoGeneral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_general_params
      params.require(:objetivo_general).permit(:titulo, :descripcion, :proyecto_id)
    end
end
