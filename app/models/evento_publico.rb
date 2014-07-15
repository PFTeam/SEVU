class EventoPublico < ActiveRecord::Base
  belongs_to :usuario

  has_many :notificaciones
  has_many :asistencia_eventos

end
