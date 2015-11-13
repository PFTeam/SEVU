class AsignacionActividadesController < ApplicationController
  before_action :set_asignacion_actividad, only: [:show, :edit, :update, :destroy]


  # GET /asignacion_actividades
  # GET /asignacion_actividades.json
  def index
		authorize! :index, AsignacionActividad
	  @actividad = Actividad.find(params[:actividad_id])
	  @asignacion_actividades = @actividad.asignacion_actividades
	  #@asignacion_actividades = AsignacionActividad.where('actividad_id =?', @actividad.id ) 
	  @proyecto = @actividad.proyecto
  end

  # GET /asignacion_actividades/1
  # GET /asignacion_actividades/1.json
  def show
		authorize! :show, AsignacionActividad
  end

  # GET /asignacion_actividades/new
  def new
		authorize! :new, AsignacionActividad
	  @actividad = Actividad.find(params[:actividad_id])
	@proyecto = @actividad.proyecto
    @asignacion_actividad = AsignacionActividad.new
  end

  # GET /asignacion_actividades/1/edit
  def edit
		authorize! :edit, AsignacionActividad
  end

  # POST /asignacion_actividades
  # POST /asignacion_actividades.json
  def create
		authorize! :create, AsignacionActividad
		@actividad = Actividad.find(params[:asignacion_actividad][:actividad_id])
  	@proyecto = @actividad.proyecto

  	if params[:asignacion_actividad][:usuario_id].to_s.blank? #(!defined? (params[:usuario_id])) && (defined? params[:usuario])
      p "VACIOOO"

  		@asignacion_actividad= AsignacionActividad.new
      @usuarios = Usuario.page(params[:page]).search query: params[:asignacion_actividad][:usuario]
  		respond_to do |format|
  			format.html { render '/asignacion_actividades/busqueda_filtrada', :actividad_id => @actividad.id, :usuario => params[:usuario] }
      end
  	else
  		p "NOOO VACIOOO"
      #aca agregar revision asignacion proyecto
      if en_proyecto(params[:asignacion_actividad][:usuario_id], @proyecto.id)
        @asignacion_actividad = AsignacionActividad.new(actividad_id: params[:asignacion_actividad][:actividad_id], usuario_id: params[:asignacion_actividad][:usuario_id])
    		@asignacion_actividad.vigente = true
        if unica(@asignacion_actividad.usuario_id,@asignacion_actividad.actividad_id) == true

    	    respond_to do |format|
      	    if  @asignacion_actividad.save
      	      format.html { redirect_to :controller => 'asignacion_actividades', :action => 'index', :actividad_id => @asignacion_actividad.actividad.id
      		      flash[:notice] = 'Asignacion actividad fue creado satisfactoriamente.' }
      	      format.json { render :show, status: :created, location: @asignacion_actividad }
      	    else
      				format.html { render :new }
      				format.json { render json: @asignacion_actividad.errors, status: :unprocessable_entity }
      	    end
          end    
    		else
    	    respond_to do |format|
    		    format.html { redirect_to :controller => 'asignacion_actividades', :action => 'index', :actividad_id => @asignacion_actividad.actividad.id
    		             flash[:notice] = 'El usuario ya se encuentra asignado' } 
          end
    		end
      else 
        respond_to do |format|
            format.html { redirect_to :controller => 'asignacion_actividades', :action => 'index', :actividad_id => params[:asignacion_actividad][:actividad_id]
                     flash[:notice] = 'El usuario no se encuentra asignado al Proyecto' } 
        end  
      end 
  	end
  end

  # PATCH/PUT /asignacion_actividades/1
  # PATCH/PUT /asignacion_actividades/1.json
  def update
		authorize! :update, AsignacionActividad
    respond_to do |format|
      if @asignacion_actividad.update(asignacion_actividad_params)
        format.html { redirect_to @asignacion_actividad, notice: 'Asignacion actividad fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @asignacion_actividad }
      else
        format.html { render :edit }
        format.json { render json: @asignacion_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  def dar_baja
    @asignacion_actividad = AsignacionActividad.find(params[:id])
    @asignacion_actividad.vigente = false
    respond_to do |format|
      if @asignacion_actividad.save
	      format.html { redirect_to :controller => 'asignacion_actividades', :action => 'index', :actividad_id => @asignacion_actividad.actividad.id
		     flash[:notice] = 'La asignación fue dada de baja satisfactoriamente.' }
        format.json { render :show, status: :created, location: @asignacion_actividad }
      end
    end
  end

  # DELETE /asignacion_actividades/1
  # DELETE /asignacion_actividades/1.json
  def destroy
		authorize! :destroy, AsignacionActividad
    @actividad_id = @asignacion_actividad.actividad_id
    @asignacion_actividad.destroy
    respond_to do |format|
	      format.html { redirect_to :controller => 'asignacion_actividades', :action => 'index', :actividad_id => @actividad_id
		      flash[:notice] = 'Asignacion actividad fue borrado satisfactoriamente.' }
      format.html { redirect_to asignacion_actividades_url, notice: 'Asignacion actividad fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def unica( usuario, actividad) 
  	if AsignacionActividad.all.where(usuario_id: usuario, actividad_id: actividad,vigente: true ).count == 0
  		p true
  		true
  	else
  		p false
  		false
  	end
  end

  def en_proyecto( usuario, proyecto)
    if AsignacionRol.all.where(usuario_id: usuario, proyecto_id: proyecto).count == 0
      p false
      false
    else
      p true
      true
    end
  end


  def busqueda_filtrada
				authorize! :busqueda_filtrada, AsignacionActividad
       @asignacion_actividad = AsignacionActividad.find(params[:id])
       @usuarios = Usuario.page(params[:page]).search query: params[:usuario]
	
  end

  def busqueda_por_habilidad
      @actividad = Actividad.find(params[:actividad_id])
      @requisito = Requisito.new
      
      if !params[:requisito][:habilidad].to_s.blank?
          

      else

	      redirect_to 'busqueda_por_habilidad', :actividad_id => @actividad.id



      end
  	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_actividad
      @asignacion_actividad = AsignacionActividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignacion_actividad_params
      params.require(:asignacion_actividad).permit(:vigente, :fechaAsignacion, :actividad_id, :usuario_id, :usuario)
    end
end
