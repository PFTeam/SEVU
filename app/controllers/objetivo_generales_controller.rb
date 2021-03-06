class ObjetivoGeneralesController < ApplicationController
  before_action :set_objetivo_general, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_generales
  # GET /objetivo_generales.json
  def index
		authorize! :index, ObjetivoGeneral
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  # GET /objetivo_generales/1
  # GET /objetivo_generales/1.json
  def show
		raise CanCan::AccessDenied if !ObjetivoGeneral.accessible_by(current_ability, :show).include?(@objetivo_general) 
    @proyecto = Proyecto.find(@objetivo_general.proyecto.id)
  end

  # GET /objetivo_generales/new
  def new
		authorize! :new, ObjetivoGeneral
    @proyecto = Proyecto.find(params[:proyecto_id])
    @objetivo_general = ObjetivoGeneral.new
  end

  # GET /objetivo_generales/1/edit
  def edit
		raise CanCan::AccessDenied if !ObjetivoGeneral.accessible_by(current_ability, :edit).include?(@objetivo_general) 
    #respond_to do |format|
    #  format.js {render partial: 'edit', content_type: 'text/html' }
    #end
  end

  # POST /objetivo_generales
  # POST /objetivo_generales.json
  def create
		authorize! :create, ObjetivoGeneral
    @objetivo_general = ObjetivoGeneral.new(objetivo_general_params)
    p @objetivo_general.proyecto_id
    @objetivo_general.active = true
    respond_to do |format|
      if @objetivo_general.save
	format.html {redirect_to :controller => 'objetivo_generales', :action => 'index',:proyecto_id => @objetivo_general.proyecto_id
	      flash[:success] = 'Objetivo general creado.' } 
        format.json { render :show, status: :created, location: @objetivo_general }
      else
        #format.html { render :new , :proyecto_id => @objetivo_general.proyecto_id }
        params[:proyecto_id] = @objetivo_general.proyecto_id
        @proyecto = Proyecto.find(params[:proyecto_id])
        format.html { render :new }
        format.json { render json: @objetivo_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_generales/1
  # PATCH/PUT /objetivo_generales/1.json
  def update
		raise CanCan::AccessDenied if !ObjetivoGeneral.accessible_by(current_ability, :update).include?(@objetivo_general) 
    @proyecto = @objetivo_general.proyecto
    respond_to do |format|
      if @objetivo_general.update(objetivo_general_params)
        format.html { redirect_to @objetivo_general
flash[:success] = 'Objetivo general fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @objetivo_general }
        format.js   { render :show, content_type: 'text/html' }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_generales/1
  # DELETE /objetivo_generales/1.json
  def destroy
		raise CanCan::AccessDenied if !ObjetivoGeneral.accessible_by(current_ability, :destroy).include?(@objetivo_general) 
    @proyecto = @objetivo_general.proyecto
    p @proyecto.id
    @objetivo_general.active = false
    @objetivo_general.save
    respond_to do |format|
	    format.html { redirect_to objetivo_generales_path(:proyecto_id => @proyecto.id)
		    flash[:success] = 'Objetivo general fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_general
      @objetivo_general = ObjetivoGeneral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_general_params
      params.require(:objetivo_general).permit(:titulo, :descripcion, :proyecto_id)
    end
end
