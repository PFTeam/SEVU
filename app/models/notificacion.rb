class Notificacion < ActiveRecord::Base

  self.abstract_class = false

  belongs_to :usuarioCreador, :class_name => "Usuario", :foreign_key => 'usuarioCreador_id'
  belongs_to :usuarioDestino, :class_name => "Usuario", :foreign_key => 'usuarioDestino_id'
  belongs_to :evento_publico
  belongs_to :proyecto
end
