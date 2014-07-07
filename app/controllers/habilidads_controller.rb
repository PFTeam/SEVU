class HabilidadsController < ApplicationController
  before_action :set_habilidad, only: [:show, :edit, :update, :destroy]

  # GET /habilidads
  # GET /habilidads.json
  def index
    @habilidads = Habilidad.all
  end

  # GET /habilidads/1
  # GET /habilidads/1.json
  def show
  end

  # GET /habilidads/new
  def new
    @habilidad = Habilidad.new
  end

  # GET /habilidads/1/edit
  def edit
  end

  # POST /habilidads
  # POST /habilidads.json
  def create
    @habilidad = Habilidad.new(habilidad_params)

    respond_to do |format|
      if @habilidad.save
        format.html { redirect_to @habilidad, notice: 'Habilidad was successfully created.' }
        format.json { render :show, status: :created, location: @habilidad }
      else
        format.html { render :new }
        format.json { render json: @habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habilidads/1
  # PATCH/PUT /habilidads/1.json
  def update
    respond_to do |format|
      if @habilidad.update(habilidad_params)
        format.html { redirect_to @habilidad, notice: 'Habilidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @habilidad }
      else
        format.html { render :edit }
        format.json { render json: @habilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habilidads/1
  # DELETE /habilidads/1.json
  def destroy
    @habilidad.destroy
    respond_to do |format|
      format.html { redirect_to habilidads_url, notice: 'Habilidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habilidad
      @habilidad = Habilidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habilidad_params
      params.require(:habilidad).permit(:nombre, :descripcion, :tipo_habilidad_id)
    end
end
