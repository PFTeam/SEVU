class HistorialEstadoUsuario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :estado_usuario

validates :usuario_id, :presence => {:message => "Usted debe ingresar un título"}
validates :estado_usuario_id, :presence => {:message => "Usted debe ingresar un título"}


end
