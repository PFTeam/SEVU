class HistorialEstadoUsuario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :estado_usuario
end
