class Proyecto < ActiveRecord::Base
 
  #Se establece que existe una foreign key
  belongs_to :tipo_proyecto
  belongs_to :necesidad

  #Se establece la relación a muchos
  has_many :objetivo_generales

  #Se establece la relación a muchos por medio de una clase intermedia
  has_many :notificacion_predeterminadas
  has_many :tipo_notificaciones, :through => :notificacion_predeterminadas

  #Se establece la relación a muchos por medio de una clase intermedia
  has_many :historial_estado_proyectos
  has_many :estado_proyectos , :through => :historial_estado_proyectos

  #Se establece la relación a uno
  has_one :informe_gasto

  #Se establece la relación a muchos
  has_many :transacciones
  has_many :postulaciones
  has_many :actividades
  has_many :notificaciones

  #Se establece la relación a muchos por medio de una clase intermedia
  has_many :asignacion_roles
  has_many :usuarios, :through => :asignacion_roles
  has_many :roles, :through => :asignacion_roles
 
  #Se establece la relación a muchos por medio de una clase intermedia
  has_many :organizacion_externas, :through => :colaboradores
  has_many :colaboradores

  #Se establece la relación a uno
  has_one :presupuesto

  #Se establecen los atributos de clases asociadas que se permitirá manejar
  accepts_nested_attributes_for :historial_estado_proyectos, :asignacion_roles, :organizacion_externas

  #Se llama a siguiente metodo para setear en 0 valores integer vacios
  before_validation :default_to_zero_if_necessary, :on => :create

  #Se valida que el nombre sea único en el sistema, que se encuentre presente y que el tamaño no sea mayor a 255 caracteres.
  validates :nombre, :uniqueness => { :message => 'No pueden existir dos proyectos con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 255 }, :presence => true

  #Se valida la presencia del atributo
  validates :fechaInicio, :presence => true
  validates :fechaFin, :presence => true

  #Se valida que el atributo sea un integer mayor o igual a 0
  validates :cantidadBeneficiariosDirectos, :numericality => { :only_integer => true , :greater_equal_than => 0}
  validates :cantidadBeneficiariosIndirectos, :numericality => { :only_integer => true , :greater_equal_than => 0}

  #Se valida el tamaño del string
  validates :localizacionGeografica, :length => { :maximum => 250 }

  #Se valida la repsencia del atributo
  validates :tipo_proyecto, :presence => true

  #Se setean a cero aquellos atributos que no han sido llenados en el formulario y son integer
  def default_to_zero_if_necessary
        self.cantidadBeneficiariosIndirectos = 0 if self.cantidadBeneficiariosIndirectos.blank?
        self.cantidadBeneficiariosDirectos = 0 if self.cantidadBeneficiariosDirectos.blank?
  end

  #Se realiza la busqueda de aquellos proyectos que se encuentran activos
  def self.activos
     Proyecto.include(:estado_proyectos, :historial_estado_proyectos).joins(historial_estado_proyectos: :estado_proyecto).where('estado_proyectos.nombre =?', 'Creado')
  end

  #Se realiza la busqueda de aquellos proyectos en los que se encuentra participando el usuario recibido
  def self.participando usu
	  Proyecto.joins(:asignacion_roles).where('asignacion_roles.usuario_id' => usu).uniq
  end

  #Se realiza la busqueda del usuario que está cumpliendo el rol de 'Director' en el proyecto
  def director
    self.asignacion_roles.each do |asignacion|
      if (asignacion.rol.nombre.to_s == 'Director') and (asignacion.rol.tipo_rol.nombre == 'Proyecto')# and (asignacion.esActual == true)   #TODO: Hacerlo menos hardcodeado?
        return asignacion.usuario
      else
        return nil
      end
    end
  end

  #Se realiza la busqueda del usuario que está cumpliendo el rol de 'Coordinador' en el  proyecto
  def coordinador
    self.asignacion_roles.each do |asignacion|
      if (asignacion.rol.nombre.to_s == 'Coordinador') and (asignacion.rol.tipo_rol.nombre == 'Proyecto')   #TODO: Hacerlo menos hardcodeado?
        return asignacion.usuario
      else
        return nil
      end
    end
  end

  #Se imprime el nombre del proyecto publicamente
  def to_s
	  nombre
  end

end
