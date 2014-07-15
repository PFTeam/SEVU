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

  has_one :presupuesto
end
