class Notificacion < ActiveRecord::Base

  self.abstract_class = false

  belongs_to :usuario_creador, :class_name => "Usuario", :foreign_key => 'usuario_creador_id'
  belongs_to :usuario_destino, :class_name => "Usuario", :foreign_key => 'usuario_destino_id'
  belongs_to :evento_publico
  belongs_to :proyecto


  validates :usuario_destino, :presence => true
  validates :mensaje, :presence => true, :length => { :minimum => 1 }
end
