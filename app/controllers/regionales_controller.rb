class RegionalesController < ApplicationController
  before_action :set_regional, only: [:show, :edit, :update, :destroy]

  # GET /regionales
  # GET /regionales.json
  def index
    @regionales = Regional.all
  end

  # GET /regionales/1
  # GET /regionales/1.json
  def show
  end

  # GET /regionales/new
  def new
    @regional = Regional.new
  end

  # GET /regionales/1/edit
  def edit
  end

  # POST /regionales
  # POST /regionales.json
  def create
    @regional = Regional.new(regional_params)

    respond_to do |format|
      if @regional.save
        format.html { redirect_to @regional, notice: 'Regional was successfully created.' }
        format.json { render :show, status: :created, location: @regional }
      else
        format.html { render :new }
        format.json { render json: @regional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regionales/1
  # PATCH/PUT /regionales/1.json
  def update
    respond_to do |format|
      if @regional.update(regional_params)
        format.html { redirect_to @regional, notice: 'Regional was successfully updated.' }
        format.json { render :show, status: :ok, location: @regional }
      else
        format.html { render :edit }
        format.json { render json: @regional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regionales/1
  # DELETE /regionales/1.json
  def destroy
    @regional.destroy
    respond_to do |format|
      format.html { redirect_to regionales_url, notice: 'Regional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regional
      @regional = Regional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regional_params
      params.require(:regional).permit(:nombre, :domicilio, :telefono_contacto, :nombre_contacto)
    end
end
