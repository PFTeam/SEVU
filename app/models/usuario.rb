class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :nombreUsuario, :email, :apellidoNombre, :contrasenia, :direccion, :fechaRegistro, :password_confirmation, :remember_me
  
  has_many :postulaciones
  has_many :asignacion_roles
  has_many :asistencia_eventos
  has_many :sesiones

  has_many :historial_estado_usuarios
  has_many :estado_usuarios, :through => :historial_estado_usuarios

  has_many :asignacion_funciones
  has_many :roles, :through => :asignacion_funciones

  has_many :evento_publicos
  has_many :postulaciones
  has_many :presupuestos
  has_many :asignacion_roles

  has_many :asignacion_actividades
  has_many :proyectos, :through => :asignacion_actividades

  has_many :notas
  has_many :notificacion_recibidas, :class_name => "Notificacion"
  has_many :notificacion_enviadas, :class_name => "Notificacion"
  has_many :necesidades

  has_attached_file :foto,
    :styles => {
        :larger => '400x400#',
        :medium => "200x200#",
        :small => "150x150#",
        :thumb => ["32x32#", :png] },
    :default_url => '/system/usuarios/fotos/missing.jpg',
    :url  => "/assets/usuarios/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/usuarios/:id/:style/:basename.:extension"
    
#<<<<<<< HEAD
  #validates_attachment_presence :foto
  validates_attachment_size :foto, :less_than => 4.megabytes
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']
#=======
#  validates_attachment_presence :foto
#  validates_attachment_size :foto, :less_than => 4.megabytes
#  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']
#>>>>>>> a13a10c37ed3180d4f92b1b96f9244442278fdcf

  def to_s
    apellido_nombre
  end  


  def self.search query: nil, limit: false
    result = Usuario.order 'apellido_nombre ASC'
    if query.present?
      result = result.where "#{table_name}.apellido_nombre ILIKE ?", "%#{query.strip}%"
    end

    limit ? result.limit(10) : result
  end

end
