class Usuario < ActiveRecord::Base
  
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
    
  validates_attachment_presence :foto
  validates_attachment_size :foto, :less_than => 4.megabytes
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']

  def to_s
    apellidoNombre
  end
  
  def to_s
    password
  end  


end
