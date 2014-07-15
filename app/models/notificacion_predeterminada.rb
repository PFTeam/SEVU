class NotificacionPredeterminada < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :tipo_notificacion
end
