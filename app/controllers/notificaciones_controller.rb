class NotificacionesController < ApplicationController
  before_action :set_notificacion, only: [:show, :edit, :update, :destroy]

  # GET /notificaciones
  # GET /notificaciones.json
  def index
		authorize! :index, Notificacion
    @notificaciones = Notificacion.all
  end

  # GET /notificaciones/1
  # GET /notificaciones/1.json
  def show
		authorize! :show, Notificacion
  end

  # GET /notificaciones/new
  def new
		authorize! :new, Notificacion
	if !params[:proyecto_id].to_s.blank?
    @proyecto = Proyecto.find(params[:proyecto_id])
		p "NO ES BLANK"
		@asignaciones = AsignacionRol.where(proyecto_id: params[:proyecto_id])
                @usuarios = []
		@asignaciones.each do |asignacion|
			@usuarios = @usuarios + asignacion.usuario.to_a
		end
                @usuarios = @usuarios.uniq
	else
		p "BLANK"
		@usuarios = Usuario.all
	end

    @notificacion = Notificacion.new
  end

  # GET /notificaciones/1/edit
  def edit
		authorize! :edit, Notificacion
  end

  # POST /notificaciones
  # POST /notificaciones.json
  def create
    authorize! :create, Notificacion

    p "Notificacion.destino: " + params[:notificacion][:usuario_creador_id].to_s

    if params[:notificacion][:mensaje].blank?

      respond_to do |format|

          if !params[:notificacion][:proyecto_id].blank?
              @proyecto = Proyecto.find(params[:notificacion][:proyecto_id][0])
              params[:proyecto_id] = @proyecto.id
              format.html { redirect_to :controller => 'notificaciones', :action => 'new', :proyecto_id => params[:notificacion][:proyecto_id][0]
                          flash[:danger] =  'El Mensaje no puede estar vacío' }
                          
          elsif !params[:notificacion][:evento_publico_id].blank?
              format.html { redirect_to :controller => 'notificaciones', :action => 'new' , :evento_publico_id => params[:notificacion][:evento_publico_id][0]
                          flash[:danger] =  'El Mensaje no puede estar vacío' }
                          
          else
              format.html { redirect_to :controller => 'notificaciones', :action => 'new' 
                          flash[:danger] =  'El Mensaje no puede estar vacío' }


          end

      end



    else
      if !params[:notificacion][:usuario_destino_ids].blank?

  	    if params[:notificacion][:type].to_s.blank?
  				   respond_to do |format|
  					    if !params[:notificacion][:proyecto_id].to_s.blank?
          					format.html { redirect_to :controller => 'notificaciones', :action => 'new', :proyecto_id => params[:notificacion][:proyecto_id][0]
          								      flash[:danger] =  'Debe ingresar un tipo de notificación' }
  					    elsif !params[:notificacion][:evento_publico_id].to_s.blank?
          					format.html { redirect_to :controller => 'notificaciones', :action => 'new' , :evento_publico_id => params[:notificacion][:evento_publico_id][0]
          								      flash[:danger] =  'Debe ingresar un tipo de notificación' }
  					    else
          					format.html { redirect_to :controller => 'notificaciones', :action => 'new' 
          								      flash[:danger] =  'Debe ingresar un tipo de notificación' }
  					    end
  				    end
  	    end
  	    params[:notificacion][:usuario_destino_ids].each do |usuario_destino|
    		    @notificacion = Notificacion.new(notificacion_params)
    		    @notificacion.usuario_creador = current_usuario
    			  @notificacion.usuario_destino = Usuario.find(usuario_destino) 
    			  if !params[:evento_publico_id].blank?
    			       @notificacion.evento_publico_id = params[:evento_publico_id]
    			  elsif !params[:eproyecto_id].blank?
                @proyecto = Proyecto.find(params[:notificacion][:proyecto_id][0])
    			       @notificacion.proyecto_id = params[:proyecto_id]
    			  end
    			  case @notificacion.type
        			  when "NotificacionEmail"
        				      @notificacion.save
        					    NotificacionMailer.enviar_notificacion(@notificacion).deliver
        				 
        			  when "NotificacionSistema"
        				      @notificacion.notificado = false
        				      @notificacion.esActiva = true
        				      @notificacion.save
        
        			  when "Ambos"
        			     if !params[:evento_publico_id].blank?
                      @notificacion_sistema.evento_publico_id = params[:evento_publico_id]
                      @notificacion_sistema.evento_publico_id = params[:evento_publico_id]
                   elsif !params[:eproyecto_id].blank?
                      @notificacion_email.proyecto_id = params[:proyecto_id]
                      @notificacion_email.proyecto_id = params[:proyecto_id]
                   end
        			    
        				    @notificacion_sistema.usuario_destino = Usuario.find(usuario_destino)
        				    @notificacion_email.usuario_destino = Usuario.find(usuario_destino)
          					@notificacion_sistema = Notificacion.new(notificacion_params)
          					@notificacion_sistema.type = "NotificacionSistema"
          					@notificacion_email = Notificacion.new(notificacino_params)
          					@notificacion_email.type = "NotificacionEmail"
          					@notificacion_email.usuario_creador = current_usuario
          					@notificacion_sistema.usuario_creador = current_usuario
          					@notificacion_sistema.notificado = false
          					@notificacion_sistema.esActiva = true
        						@notificacion_sistema.save 
        						@notificacion_email.save
        						NotificacionMailer.enviar_notificacion(@notificacion_email).deliver
        			  else 
        
        
        			  end
  	       end
  	      
  	      
  	       respond_to do |format|



              if !params[:notificacion][:proyecto_id].blank?
                format.html { redirect_to :controller => 'notificaciones', :action => 'new', :proyecto_id => params[:notificacion][:proyecto_id][0]
                            flash[:success] =  'Notificacion fue creado satisfactoriamente.' }
              elsif !params[:notificacion][:evento_publico_id].blank?
                @evento_publico = EventoPublico.find(params[:notificacion][:evento_publico_id][0])
                format.html { redirect_to @evento_publico
                            flash[:success] =  'Notificacion fue creada satisfactoriamente.' }

              else
                format.html { redirect_to :controller => 'notificacion_sistemas', :action => 'index' 
                           flash[:success] =  'Notificacion fue creado satisfactoriamente.' }

              end

               
  	      end
  	      
  	      
      else
  	    respond_to do |format|
  		    if !params[:notificacion][:proyecto_id].blank?
  		format.html { redirect_to :controller => 'notificaciones', :action => 'new', :proyecto_id => params[:notificacion][:proyecto_id][0]
  					      flash[:danger] =  'Debe ingresar al menos un usuario destino' }
  		    elsif !params[:notificacion][:evento_publico_id].blank?
  		format.html { redirect_to :controller => 'notificaciones', :action => 'new' , :evento_publico_id => params[:notificacion][:evento_publico_id][0]
  					      flash[:danger] =  'Debe ingresar al menos un usuario destino' }

  		    else
  		format.html { redirect_to :controller => 'notificaciones', :action => 'new' 
  					      flash[:danger] =  'Debe ingresar al menos un usuario destino' }

  		    end

  	    end
      end
    end
  end

  # PATCH/PUT /notificaciones/1
  # PATCH/PUT /notificaciones/1.json
  def update
		authorize! :update, Notificacion
    respond_to do |format|
      if @notificacion.update(notificacion_params)
        format.html { redirect_to @notificacion, notice: 'Notificacion fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @notificacion }
      else
        format.html { render :edit }
        format.json { render json: @notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificaciones/1
  # DELETE /notificaciones/1.json
  def destroy
		authorize! :destroy, Notificacion
    @notificacion.destroy
    respond_to do |format|
      format.html { redirect_to notificaciones_url, notice: 'Notificacion fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion
      @notificacion = Notificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_params
      params.require(:notificacion).permit(:esActiva, :mensaje, :notificado, :usuario_creador_id, :usuario_destino_id, :evento_publico_id, :proyecto_id, :type, :usuario_destino_ids, :evento_publico_id)
    end
end
