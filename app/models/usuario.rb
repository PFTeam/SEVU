class Usuario < ActiveRecord::Base

  has_many :postulaciones
  has_many :asignacion_roles
  has_many :asistencia_eventos
  has_many :sesiones
  has_many :historial_estado_usuarios
  has_many :asignacion_funciones
  has_many :evento_publicos
  has_many :postulaciones
  has_many :presupuestos
  has_many :asignacion_roles
  has_many :asignacion_actividades
  has_many :notas
  has_many :notificacion_recibidas, :class_name => "Notificacion"
  has_many :notificacion_enviadas, :class_name => "Notificacion"
  has_many :necesidades


end
