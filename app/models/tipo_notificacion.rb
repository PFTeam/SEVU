class TipoNotificacion < ActiveRecord::Base

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Tipos con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, presence => true
end
