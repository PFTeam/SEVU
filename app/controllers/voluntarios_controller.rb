class VoluntariosController < ApplicationController
  #respond_to :html, :xml, :json
  
  before_action :set_voluntario, only: [:show, :edit, :update, :destroy, :gestionar_experiencias, 
    :gestion_horarios_disponibles,:gestion_horario_disponibles]
    #ingerto juan
  before_action :set_todasHabilidades, only: [ :gestionar_experiencias, :gestion_horarios_disponibles,:gestion_horario_disponibles]
  before_action :BuscarTipoHabilidad, only: [:gestionar_experiencias ]

def buscarusuario 
		
    @usuarios = Usuario.where(nombreUsuario: params[:usuario_bucar])
end


def buscar_usuario
  @usuarios = Usuario.where(nombreUsuario: params[:usuario_bucar])
 # @usuarios = Usuario.where( nombreUsuario: params[:usuario_bucar])

end  

def mis_notas
  authorize! :mis_notas, Usuario
end


def buscar_voluntario
 
     @voluntario = Voluntario.where(nombreUsuario: params[:usuario_bucar]) 
    if  @voluntario.nil? then
      puts "no hay voluntario"
      nil
    else
      puts "se encontro"
       @voluntario
    end
end

 # GET /voluntarios
  # GET /voluntarios.json
  def index2
       @voluntarios = Voluntario.all
   end


   def index
	authorize! :index, Voluntario
 @voluntario = Voluntario.search(params[:searchbox])
    
 if  @voluntario.nil?
   @voluntario = Voluntario.all
 end

  respond_to do |format|

   format.html # index.html.erb

  end

end

 def buscar_por_legajo
   #empleado = Empleado.select("id, nombre, apellido").where(:legajo => params[:legajo]);
  # @usuario =Usuario.select("id, nombreUsuario, apellido_nombre").where(:legajo => params[:legajo]);
    usuario =Usuario.where(:legajo => params[:legajo])
   #Devuelve un json como salida al navegador.
 
   render :json => usuario[0]
#format.json usuario[0]
end
  
   def adminitrar_estado_usuario
    
     @estado_usuarios = EstadoUsuario.all
  end



 def set_todasHabilidades 
    @habilidades = Habilidad.all
    @voluntario = Voluntario.find(params[:id])
 @horario_disponibles = HorarioDisponible.where(voluntario_id: params[:id])
 
#horario_disponibles =@voluntario.horario_disponibles.all
    
  end
  
 
  


  def buscarusuarios
     @codigo = params[:nombre]
     @voluntario = Voluntario.where(legajo: params[:legajo] ) 
    if  @voluntario.nil? then
      puts "no hay voluntario"
      nil
    else
      puts "se encontro"
       @voluntario
    end
  end
  
  def gestionar_estado_usuario
	authorize! :gestionar_estado_usuario, Usuario
    @estado=EstadoUsuario.all
 @usuario=Usuario.all
 @voluntario=Voluntario.first
 #@voluntario = Voluntario.where(legajo: params[:legajo] ) 
  end
#fin ingerto juan

 

  def gestionar_experiencias
  @experiencias = Experiencia.where(voluntario_id: params[:id])
      @habilidades = Habilidad.all
       @tipo_habilidades = TipoHabilidad.all
    end

  def BuscarTipoHabilidad
    @tipo_habilidades = TipoHabilidad.all  
  end
  
  
#Pagina Nota Personal
  def gestionar_nota_P
    authorize! :gestionar_nota_P, Usuario
   @voluntario = Voluntario.find(params[:id])
    #no lo veo muy seguro por eso pongo lo siguiente:
    #@voluntario = Usuario.find(current_usuario.id)
    #@notap = Nota.where(voluntario_id: params[:id])
   @notap = @voluntario.notas
   # @notap = Nota.all.where(usuario_id: current_usuario.id)

  end
  
  # GET /voluntarios/1
  # GET /voluntarios/1.json
  def show
		authorize! :show, Voluntario
  end

  # GET /voluntarios/new
  def new
		authorize! :new, Voluntario
    @voluntario = Voluntario.new
  end
 
  
  
  
  # GET /voluntarios/1/edit
  def edit

		authorize! :edit, Voluntario
  end

  # POST /voluntarios
  # POST /voluntarios.json
  def create

		authorize! :create, Voluntario
    @voluntario = Voluntario.new(voluntario_params)

    respond_to do |format|
      if @voluntario.save
        format.html { redirect_to @voluntario
flash[:success] = 'Voluntario fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @voluntario }
      else
        format.html { render :new }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voluntarios/1
  # PATCH/PUT /voluntarios/1.json
  
  def update
		authorize! :update, Voluntario
    respond_to do |format|
      if @voluntario.update(voluntario_params)
        format.html { redirect_to @voluntario
flash[:success] = 'Voluntario fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @voluntario }
      else
        format.html { render :edit }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntarios/1
  # DELETE /voluntarios/1.json
  def destroy
		authorize! :destroy, Voluntario
    @voluntario.destroy
    respond_to do |format|
      format.html { redirect_to voluntarios_url
flash[:success] = 'Voluntario fue borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
  
def gestion_horarios_disponibles
  authorize! :gestion_horarios_disponibles, Voluntario
 @voluntario = Voluntario.find(params[:id])
 @horario_disponibles = HorarioDisponible.where(voluntario_id: @voluntario.id)
 
#@horario_disponibles =@voluntario.horario_disponibles.all
end


    # Use callbacks to share common setup or constraints between actions.
    def set_voluntario
       @voluntario = Voluntario.find(params[:id])
    end
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def voluntario_params
      params.require(:voluntario).permit(:nombreUsuario, :contrasenia, :apellidoNombre, 
      :email, :direccion, :fechaRegistro, :foto, :legajo, :id)
    end

end

  
