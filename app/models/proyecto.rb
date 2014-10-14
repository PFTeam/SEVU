class Proyecto < ActiveRecord::Base
  belongs_to :tipo_proyecto
  belongs_to :necesidad


  has_many :objetivo_generales

  has_many :notificacion_predeterminadas
  has_many :tipo_notificaciones, :through => :notificacion_predeterminadas


  has_many :historial_estado_proyectos
  has_many :estado_proyectos , :through => :historial_estado_proyectos

  has_one :informe_gasto
  has_many :transacciones
  has_many :postulaciones
  has_many :actividades
  has_many :notificaciones

  has_many :asignacion_roles
  has_many :usuarios, :through => :asignacion_roles
  has_many :roles, :through => :asignacion_roles
 
  has_many :organizacion_externas, :through => :colaboradores
  has_many :colaboradores

  has_one :presupuesto

  accepts_nested_attributes_for :historial_estado_proyectos, :asignacion_roles, :organizacion_externas

  before_validation :default_to_zero_if_necessary, :on => :create

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos proyectos con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :fechaInicio, :presence => true
  validates :fechaFin, :presence => true
  validates :cantidadBeneficiariosDirectos, :numericality => { :only_integer => true , :greater_equal_than => 0}
  validates :cantidadBeneficiariosIndirectos, :numericality => { :only_integer => true , :greater_equal_than => 0}
  validates :localizacionGeografica, :length => { :maximum => 250 }
  validates :tipo_proyecto, :presence => true


  def default_to_zero_if_necessary
        self.cantidadBeneficiariosIndirectos = 0 if self.cantidadBeneficiariosIndirectos.blank?
        self.cantidadBeneficiariosDirectos = 0 if self.cantidadBeneficiariosDirectos.blank?
  end

  def self.activos
    #TODO: No devuelve solo los que el último estado es 'Activo'
     Proyecto.includes(:estado_proyectos, :historial_estado_proyectos).joins(historial_estado_proyectos: :estado_proyecto).where('estado_proyectos.nombre =?', 'Creado')
  end

  def self.participando usu
	  Proyecto.joins(:asignacion_roles).where('asignacion_roles.usuario_id' => usu).uniq
    #CONTROLAR QUE NO SE REPITAN!
  end

  def director
    self.asignacion_roles.each do |asignacion|
      if (asignacion.rol.nombre.to_s == 'Director') and (asignacion.rol.tipo_rol.nombre == 'Proyecto')# and (asignacion.esActual == true)   #TODO: Hacerlo menos hardcodeado?
        return asignacion.usuario
      else
        return nil
      end
    end
  end

  def coordinador
    self.asignacion_roles.each do |asignacion|
      if (asignacion.rol.nombre.to_s == 'Coordinador') and (asignacion.rol.tipo_rol.nombre == 'Proyecto')   #TODO: Hacerlo menos hardcodeado?
        return asignacion.usuario
      else
        return nil
      end
    end
  end

  def to_s
	  nombre
  end

end
