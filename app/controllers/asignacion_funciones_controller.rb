class AsignacionFuncionesController < ApplicationController
  before_action :set_asignacion_funcion, only: [:show, :edit, :update, :destroy]

  # GET /asignacion_funciones
  # GET /asignacion_funciones.json
  def index
    @asignacion_funciones = AsignacionFuncion.all
  end

  # GET /asignacion_funciones/1
  # GET /asignacion_funciones/1.json
  def show
  end

  # GET /asignacion_funciones/new
  def new
    @asignacion_funcion = AsignacionFuncion.new
  end

  # GET /asignacion_funciones/1/edit
  def edit
  end

  # POST /asignacion_funciones
  # POST /asignacion_funciones.json
  def create
    @asignacion_funcion = AsignacionFuncion.new(asignacion_funcion_params)

    respond_to do |format|
      if @asignacion_funcion.save
        format.html { redirect_to @asignacion_funcion, notice: 'Asignacion funcion was successfully created.' }
        format.json { render :show, status: :created, location: @asignacion_funcion }
      else
        format.html { render :new }
        format.json { render json: @asignacion_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_funciones/1
  # PATCH/PUT /asignacion_funciones/1.json
  def update
    respond_to do |format|
      if @asignacion_funcion.update(asignacion_funcion_params)
        format.html { redirect_to @asignacion_funcion, notice: 'Asignacion funcion was successfully updated.' }
        format.json { render :show, status: :ok, location: @asignacion_funcion }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_funciones/1
  # DELETE /asignacion_funciones/1.json
  def destroy
    @asignacion_funcion.destroy
    respond_to do |format|
      format.html { redirect_to asignacion_funciones_url, notice: 'Asignacion funcion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_funcion
      @asignacion_funcion = AsignacionFuncion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_funcion_params
      params.require(:asignacion_funcion).permit(:fechaAsignacion, :esActual, :descripcion, :usuario_id, :rol_id)
    end
end