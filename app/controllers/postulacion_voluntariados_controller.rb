class PostulacionVoluntariadosController < ApplicationController
  before_action :set_postulacion_voluntariado, only: [:show, :edit, :update, :destroy]

  # GET /postulacion_voluntariados
  # GET /postulacion_voluntariados.json
  def index
    @postulacion_voluntariados = PostulacionVoluntariado.all
  end

  # GET /postulacion_voluntariados/1
  # GET /postulacion_voluntariados/1.json
  def show
  end

  # GET /postulacion_voluntariados/new
  def new
    @postulacion_voluntariado = PostulacionVoluntariado.new
  end

  # GET /postulacion_voluntariados/1/edit
  def edit
  end

  # POST /postulacion_voluntariados
  # POST /postulacion_voluntariados.json
  def create
    @postulacion_voluntariado = PostulacionVoluntariado.new(postulacion_voluntariado_params)

    respond_to do |format|
      if @postulacion_voluntariado.save
        format.html { redirect_to @postulacion_voluntariado, notice: 'Postulacion voluntariado was successfully created.' }
        format.json { render :show, status: :created, location: @postulacion_voluntariado }
      else
        format.html { render :new }
        format.json { render json: @postulacion_voluntariado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulacion_voluntariados/1
  # PATCH/PUT /postulacion_voluntariados/1.json
  def update
    respond_to do |format|
      if @postulacion_voluntariado.update(postulacion_voluntariado_params)
        format.html { redirect_to @postulacion_voluntariado, notice: 'Postulacion voluntariado was successfully updated.' }
        format.json { render :show, status: :ok, location: @postulacion_voluntariado }
      else
        format.html { render :edit }
        format.json { render json: @postulacion_voluntariado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulacion_voluntariados/1
  # DELETE /postulacion_voluntariados/1.json
  def destroy
    @postulacion_voluntariado.destroy
    respond_to do |format|
      format.html { redirect_to postulacion_voluntariados_url, notice: 'Postulacion voluntariado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion_voluntariado
      @postulacion_voluntariado = PostulacionVoluntariado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulacion_voluntariado_params
      params.require(:postulacion_voluntariado).permit(:fechaPostulacion, :aceptado, :proyecto_id, :usuario_id)
    end
end
