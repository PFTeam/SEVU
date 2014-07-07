class Notificacion < ActiveRecord::Base
  belongs_to :usuarioCreador
  belongs_to :usuarioDestino
  belongs_to :evento_publico
  belongs_to :proyecto
end
