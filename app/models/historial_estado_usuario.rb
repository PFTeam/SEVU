class HistorialEstadoUsuario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :estado_usuario


  validates :proyecto, :presence => true
  validates :estado_proyecto, :presence => true 
end
