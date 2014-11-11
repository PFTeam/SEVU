class EstadoAcademicosController < ApplicationController
  before_action :set_estado_academico, only: [:show, :edit, :update, :destroy]

  # GET /estado_academicos
  # GET /estado_academicos.json
  def index
    @estado_academicos = EstadoAcademico.all
  end

  # GET /estado_academicos/1
  # GET /estado_academicos/1.json
  def show
  end

  # GET /estado_academicos/new
  def new
    @estado_academico = EstadoAcademico.new
  end

  # GET /estado_academicos/1/edit
  def edit
  end

  # POST /estado_academicos
  # POST /estado_academicos.json
  def create
    @estado_academico = EstadoAcademico.new(estado_academico_params)

    respond_to do |format|
      if @estado_academico.save
        format.html { redirect_to @estado_academico, notice: 'Estado academico was successfully created.' }
        format.json { render :show, status: :created, location: @estado_academico }
      else
        format.html { render :new }
        format.json { render json: @estado_academico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_academicos/1
  # PATCH/PUT /estado_academicos/1.json
  def update
    respond_to do |format|
      if @estado_academico.update(estado_academico_params)
        format.html { redirect_to @estado_academico, notice: 'Estado academico was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_academico }
      else
        format.html { render :edit }
        format.json { render json: @estado_academico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_academicos/1
  # DELETE /estado_academicos/1.json
  def destroy
    @estado_academico.destroy
    respond_to do |format|
      format.html { redirect_to estado_academicos_url, notice: 'Estado academico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_academico
      @estado_academico = EstadoAcademico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_academico_params
      params.require(:estado_academico).permit(:cantidad_materias_regulares, :cantidad_materias_aprobadas, :cantidad_materias_cursando, :usuario_id)
    end
end
