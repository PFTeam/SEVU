class SesionesController < ApplicationController
  before_action :set_sesion, only: [:show, :edit, :update, :destroy]

  # GET /sesiones
  # GET /sesiones.json
  def index
		authorize! :index, Sesion
    @sesiones = Sesion.all
  end

  # GET /sesiones/1
  # GET /sesiones/1.json
  def show
		authorize! :show, Sesion
  end

  # GET /sesiones/new
  def new
		authorize! :new, Sesion
    @sesion = Sesion.new
  end

  # GET /sesiones/1/edit
  def edit
		authorize! :edit, Sesion
  end

  # POST /sesiones
  # POST /sesiones.json
  def create
		authorize! :create, Sesion
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

  # PATCH/PUT /sesiones/1
  # PATCH/PUT /sesiones/1.json
  def update
		authorize! :update, Sesion
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

  # DELETE /sesiones/1
  # DELETE /sesiones/1.json
  def destroy
		authorize! :destroy, Sesion
    @sesion.destroy
    respond_to do |format|
      format.html { redirect_to sesiones_url, notice: 'Sesion was successfully destroyed.' }
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
