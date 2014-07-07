class RestriccionesController < ApplicationController
  before_action :set_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /restricciones
  # GET /restricciones.json
  def index
    @restricciones = Restriccion.all
  end

  # GET /restricciones/1
  # GET /restricciones/1.json
  def show
  end

  # GET /restricciones/new
  def new
    @restriccion = Restriccion.new
  end

  # GET /restricciones/1/edit
  def edit
  end

  # POST /restricciones
  # POST /restricciones.json
  def create
    @restriccion = Restriccion.new(restriccion_params)

    respond_to do |format|
      if @restriccion.save
        format.html { redirect_to @restriccion, notice: 'Restriccion was successfully created.' }
        format.json { render :show, status: :created, location: @restriccion }
      else
        format.html { render :new }
        format.json { render json: @restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restricciones/1
  # PATCH/PUT /restricciones/1.json
  def update
    respond_to do |format|
      if @restriccion.update(restriccion_params)
        format.html { redirect_to @restriccion, notice: 'Restriccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @restriccion }
      else
        format.html { render :edit }
        format.json { render json: @restriccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restricciones/1
  # DELETE /restricciones/1.json
  def destroy
    @restriccion.destroy
    respond_to do |format|
      format.html { redirect_to restricciones_url, notice: 'Restriccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restriccion
      @restriccion = Restriccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restriccion_params
      params.require(:restriccion).permit(:fechaDesde, :fechaHasta, :esActiva, :tipo_proyecto_id)
    end
end
