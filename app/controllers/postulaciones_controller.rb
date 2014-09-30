class PostulacionesController < ApplicationController
  before_action :set_postulacion, only: [:show, :edit, :update, :destroy]

  # GET /postulaciones
  # GET /postulaciones.json
  def index
	  @postulaciones = Postulacion.where('proyecto_id = ?', params[:proyecto_id]).order(:created_at)
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /postulaciones/1
  # GET /postulaciones/1.json
  def show
  end

  # GET /postulaciones/new
  def new
    @postulacion = Postulacion.new
    @postulacion.aceptado=false
  end

  # GET /postulaciones/1/edit
  def edit
  end

  # POST /postulaciones
  # POST /postulaciones.json
  def create
    @postulacion = Postulacion.new(postulacion_params)
    @postulacion.aceptado=false

    respond_to do |format|
      if @postulacion.save
	format.html {redirect_to :controller => 'proyectos', :action => 'index', notice: 'Se ha registrado tu participación'  } 
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

  def aceptar
    @postulacion = Postulacion.find(params[:id])
    @postulacion.aceptar
    @postulacion.save
    respond_to do |format|
	    format.html {redirect_to :controller => 'postulaciones', :action => 'index', notice: 'Se ha registrado tu participación', :proyecto_id => @postulacion.proyecto.id  } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion
      @postulacion = Postulacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulacion_params
      params.require(:postulacion).permit(:aceptado, :proyecto_id, :usuario_id)
    end
end
