class EstadoUsuario < ActiveRecord::Base

  has_many :historial_estado_usuarios
  has_many :usuarios, :through => :historial_estado_usuarios

end
