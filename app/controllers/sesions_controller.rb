class SesionsController < ApplicationController
  before_action :set_sesion, only: [:show, :edit, :update, :destroy]

  # GET /sesions
  # GET /sesions.json
  def index
    @sesions = Sesion.all
  end

  # GET /sesions/1
  # GET /sesions/1.json
  def show
  end

  # GET /sesions/new
  def new
    @sesion = Sesion.new
  end

  # GET /sesions/1/edit
  def edit
  end

  # POST /sesions
  # POST /sesions.json
  def create
    @sesion = Sesion.new(sesion_params)

    respond_to do |format|
      if @sesion.save
        format.html { redirect_to @sesion, notice: 'Sesion was successfully created.' }
        format.json { render :show, status: :created, location: @sesion }
      else
        format.html { render :new }
        format.json { render json: @sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sesions/1
  # PATCH/PUT /sesions/1.json
  def update
    respond_to do |format|
      if @sesion.update(sesion_params)
        format.html { redirect_to @sesion, notice: 'Sesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @sesion }
      else
        format.html { render :edit }
        format.json { render json: @sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sesions/1
  # DELETE /sesions/1.json
  def destroy
    @sesion.destroy
    respond_to do |format|
      format.html { redirect_to sesions_url, notice: 'Sesion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesion
      @sesion = Sesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesion_params
      params.require(:sesion).permit(:fechaInicio, :fechaFin, :usuario_id)
    end
end
