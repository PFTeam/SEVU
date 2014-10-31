class NotificacionPredeterminada < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :tipo_notificacion

  validates :tipo_notificacion, uniqueness: {
    scope: :proyecto,
    message: '- No pueden existir dos Notificaciones Predeterminadas para el mismo proyecto' }

end
