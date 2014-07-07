class RestriccionsController < ApplicationController
  before_action :set_restriccion, only: [:show, :edit, :update, :destroy]

  # GET /restriccions
  # GET /restriccions.json
  def index
    @restriccions = Restriccion.all
  end

  # GET /restriccions/1
  # GET /restriccions/1.json
  def show
  end

  # GET /restriccions/new
  def new
    @restriccion = Restriccion.new
  end

  # GET /restriccions/1/edit
  def edit
  end

  # POST /restriccions
  # POST /restriccions.json
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

  # PATCH/PUT /restriccions/1
  # PATCH/PUT /restriccions/1.json
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

  # DELETE /restriccions/1
  # DELETE /restriccions/1.json
  def destroy
    @restriccion.destroy
    respond_to do |format|
      format.html { redirect_to restriccions_url, notice: 'Restriccion was successfully destroyed.' }
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
