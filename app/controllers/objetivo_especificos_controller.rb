class ObjetivoEspecificosController < ApplicationController
  before_action :set_objetivo_especifico, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_especificos
  # GET /objetivo_especificos.json
  def index
    @objetivo_general = ObjetivoGeneral.find(params[:objetivo_general_id])
    @proyecto = @objetivo_general.proyecto
  end

  # GET /objetivo_especificos/1
  # GET /objetivo_especificos/1.json
  def show
	  @proyecto = Proyecto.find(@objetivo_especifico.objetivo_general.proyecto.id)
  end

  # GET /objetivo_especificos/new
  def new
    @objetivo_especifico = ObjetivoEspecifico.new(:objetivo_general_id => params[:objetivo_general_id])
  end

  # GET /objetivo_especificos/1/edit
  def edit
    respond_to do |format|
      format.js {render partial: 'edit', content_type: 'text/html' }
    end
  end

  # POST /objetivo_especificos
  # POST /objetivo_especificos.json
  def create
    @objetivo_especifico = ObjetivoEspecifico.new(objetivo_especifico_params)

    respond_to do |format|
      if @objetivo_especifico.save
        format.html { redirect_to :controller => 'objetivo_especificos', :action => 'index', :objetivo_general_id => @objetivo_especifico.objetivo_general_id, notice: 'Objetivo especifico was successfully created.' }
        format.json { render :show, status: :created, location: @objetivo_especifico }
      else
        format.html { render :new }
        format.json { render json: @objetivo_especifico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_especificos/1
  # PATCH/PUT /objetivo_especificos/1.json
  def update
    respond_to do |format|
      if @objetivo_especifico.update(objetivo_especifico_params)
        format.html { redirect_to @objetivo_especifico, notice: 'Objetivo especifico was successfully updated.' }
        format.json { render :show, status: :ok, location: @objetivo_especifico }
        format.js   { render :show, content_type: 'text/html' }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_especifico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_especificos/1
  # DELETE /objetivo_especificos/1.json
  def destroy
    @objetivo_especifico.destroy
    respond_to do |format|
      format.html { redirect_to objetivo_especificos_url, notice: 'Objetivo especifico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_especifico
      @objetivo_especifico = ObjetivoEspecifico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_especifico_params
      params.require(:objetivo_especifico).permit(:titulo, :descripcion, :objetivo_general_id)
    end
end
