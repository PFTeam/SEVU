class NecesidadsController < ApplicationController
  before_action :set_necesidad, only: [:show, :edit, :update, :destroy]

  # GET /necesidads
  # GET /necesidads.json
  def index
    @necesidads = Necesidad.all
  end

  # GET /necesidads/1
  # GET /necesidads/1.json
  def show
  end

  # GET /necesidads/new
  def new
    @necesidad = Necesidad.new
  end

  # GET /necesidads/1/edit
  def edit
  end

  # POST /necesidads
  # POST /necesidads.json
  def create
    @necesidad = Necesidad.new(necesidad_params)

    respond_to do |format|
      if @necesidad.save
        format.html { redirect_to @necesidad, notice: 'Necesidad was successfully created.' }
        format.json { render :show, status: :created, location: @necesidad }
      else
        format.html { render :new }
        format.json { render json: @necesidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /necesidads/1
  # PATCH/PUT /necesidads/1.json
  def update
    respond_to do |format|
      if @necesidad.update(necesidad_params)
        format.html { redirect_to @necesidad, notice: 'Necesidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @necesidad }
      else
        format.html { render :edit }
        format.json { render json: @necesidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /necesidads/1
  # DELETE /necesidads/1.json
  def destroy
    @necesidad.destroy
    respond_to do |format|
      format.html { redirect_to necesidads_url, notice: 'Necesidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_necesidad
      @necesidad = Necesidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def necesidad_params
      params.require(:necesidad).permit(:descripcion, :fechaCreacion, :ambitoAplicacion, :usuario_id)
    end
end
