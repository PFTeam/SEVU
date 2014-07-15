class ObjetivoGeneralesController < ApplicationController
  before_action :set_objetivo_general, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_generales
  # GET /objetivo_generales.json
  def index
    @objetivo_generales = ObjetivoGeneral.all
  end

  # GET /objetivo_generales/1
  # GET /objetivo_generales/1.json
  def show
  end

  # GET /objetivo_generales/new
  def new
    @objetivo_general = ObjetivoGeneral.new
  end

  # GET /objetivo_generales/1/edit
  def edit
  end

  # POST /objetivo_generales
  # POST /objetivo_generales.json
  def create
    @objetivo_general = ObjetivoGeneral.new(objetivo_general_params)

    respond_to do |format|
      if @objetivo_general.save
        format.html { redirect_to @objetivo_general, notice: 'Objetivo general was successfully created.' }
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
    respond_to do |format|
      if @objetivo_general.update(objetivo_general_params)
        format.html { redirect_to @objetivo_general, notice: 'Objetivo general was successfully updated.' }
        format.json { render :show, status: :ok, location: @objetivo_general }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_generales/1
  # DELETE /objetivo_generales/1.json
  def destroy
    @objetivo_general.destroy
    respond_to do |format|
      format.html { redirect_to objetivo_generales_url, notice: 'Objetivo general was successfully destroyed.' }
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
      params.require(:objetivo_general).permit(:titulo, :description, :proyecto_id)
    end
end
