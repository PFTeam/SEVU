class ReportesController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reportes
  # GET /reportes.json
  def index
    @reportes = Reporte.all
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show
  end

  # GET /reportes/new
  def new
    @report = Reporte.new
  end

  # GET /reportes/1/edit
  def edit
  end

  # POST /reportes
  # POST /reportes.json
  def create
    @report = Reporte.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Reporte was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportes/1
  # PATCH/PUT /reportes/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Reporte was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reportes_url, notice: 'Reporte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Reporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:descripcion, :asignacion_actividad_id)
    end
end
