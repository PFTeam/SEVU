class Proyecto < ActiveRecord::Base
  belongs_to :tipo_proyecto
  belongs_to :necesidad


  has_many :objetivo_generales

  has_many :proyecto_tipo_notificaciones
  has_many :tipo_notificaciones, :through => :notificacion_predeterminadas


  has_many :historial_estado_proyectos
  has_many :estado_proyectos , :through => :historial_estado_proyectos

  has_many :informe_gastos
  has_many :transacciones
  has_many :postulaciones
  has_many :actividades
  has_many :notificaciones

  has_many :asignacion_roles
  has_many :usuarios, :through => :asignacion_roles
  has_many :roles, :through => :asignacion_roles
  
  has_one :presupuesto

  accepts_nested_attributes_for :historial_estado_proyectos, :asignacion_roles

  def self.activos
  #  Proyecto.joins(:historial_estado_proyectos).where('historial_estado_proyectos.esActual' => 'True').includes(:estado_proyectos).where('estado_proyectos.nombre' => 'Activo')
    
    Proyecto.includes(:historial_estado_proyectos, :estado_proyectos).where('historial_estado_proyectos.esActual' => 'True','estado_proyectos.nombre' => 'Activo')
    
  end

  def self.participando usu
    Proyecto.joins(:asignacion_roles).where('asignacion_roles.usuario_id' => usu)
  end

  def director
    self.asignacion_roles.each do |asignacion|
      if (asignacion.rol.nombre.to_s == 'Director') and (asignacion.rol.tipo_rol.nombre == 'Proyecto')   #TODO: Hacerlo menos hardcodeado?
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

end
