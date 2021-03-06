class RequisitosController < ApplicationController
  before_action :set_requisito, only: [:show, :edit, :update, :destroy]

  # GET /requisitos
  # GET /requisitos.json
  def index
		authorize! :index, Requisito
    @requisitos = Requisito.all
  end

  # GET /requisitos/1
  # GET /requisitos/1.json
  def show
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @requisito.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @requisito.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :show).include?(@requisito)
		else
			authorize! :show, Requisito
		end
  end

  # GET /requisitos/new
  def new
    @actividad = Actividad.find(params[:actividad_id])
    @proyecto = @actividad.proyecto
    @requisitos = Requisito.all.where(actividad: @actividad)
    @requisito = Requisito.new(actividad: @actividad)
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @proyecto).count == 1
			raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :new).include?(@requisitos.first)
		else
			authorize! :new, Requisito
		end
  end

  # GET /requisitos/1/edit
  def edit
		raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :edit).include?(@requisito)
  end

  # POST /requisitos
  # POST /requisitos.json
  def create
    @requisito = Requisito.new(requisito_params)
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @requisito.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @requisito.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :create).include?(Requisito.all.where(actividad: @requisito.actividad).first)
		else
			authorize! :create, Requisito
		end
    respond_to do |format|
	    if @requisito.unico && @requisito.save
	      format.html { redirect_to :action => 'new', :actividad_id => @requisito.actividad
		    flash[:success] = 'Requisito fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @requisito }
      else
	      flash[:danger] = 'Por favor ingrese alguna habilidad correcta'
        format.html { redirect_to :action => 'new', :actividad_id => params[:requisito][:actividad_id] }
        format.json { render json: @requisito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitos/1
  # PATCH/PUT /requisitos/1.json
  def update
		raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :update).include?(@requisito)
    respond_to do |format|
      if @requisito.update(requisito_params)
	      format.html { redirect_to :action => 'new', :actividad_id => @requisito.actividad
		    flash[:success] = 'Requisito fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @requisito }
      else
        format.html { render :edit }
        format.json { render json: @requisito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitos/1
  # DELETE /requisitos/1.json
  def destroy
		if current_usuario.asignacion_roles.where(esActual: true, id: Rol.where(nombre: "Voluntario"), proyecto: @requisito.actividad.proyecto) && current_usuario.asignacion_roles.where(esActual: true, proyecto: @requisito.actividad.proyecto).count == 1
			raise CanCan::AccessDenied if !Requisito.accessible_by(current_ability, :destroy).include?(@requisito)
		else
			authorize! :destroy, Requisito
		end
	@actividad_id = @requisito.actividad_id
    @requisito.destroy
    respond_to do |format|
	      format.html { redirect_to :action => 'new', :actividad_id => @actividad_id
		    flash[:success] = 'Requisito fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisito
      @requisito = Requisito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisito_params
      params.require(:requisito).permit(:actividad_id, :habilidad_id)
    end
end
