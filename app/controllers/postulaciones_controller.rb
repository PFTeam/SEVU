class PostulacionesController < ApplicationController
  before_action :set_postulacion, only: [:show, :edit, :update, :destroy]

  # GET /postulaciones
  # GET /postulaciones.json
  def index
    @postulaciones = Postulacion.all
  end

  # GET /postulaciones/1
  # GET /postulaciones/1.json
  def show
  end

  # GET /postulaciones/new
  def new
    @postulacion = Postulacion.new
  end

  # GET /postulaciones/1/edit
  def edit
  end

  # POST /postulaciones
  # POST /postulaciones.json
  def create
    @postulacion = Postulacion.new(postulacion_params)

    respond_to do |format|
      if @postulacion.save
        format.html { redirect_to @postulacion, notice: 'Postulacion was successfully created.' }
        format.json { render :show, status: :created, location: @postulacion }
      else
        format.html { render :new }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulaciones/1
  # PATCH/PUT /postulaciones/1.json
  def update
    respond_to do |format|
      if @postulacion.update(postulacion_params)
        format.html { redirect_to @postulacion, notice: 'Postulacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @postulacion }
      else
        format.html { render :edit }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulaciones/1
  # DELETE /postulaciones/1.json
  def destroy
    @postulacion.destroy
    respond_to do |format|
      format.html { redirect_to postulaciones_url, notice: 'Postulacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion
      @postulacion = Postulacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulacion_params
      params.require(:postulacion).permit(:fechaPostulacion, :aceptado, :proyecto_id, :usuario_id)
    end
end
