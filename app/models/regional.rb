class Regional < ActiveRecord::Base
has_many :proyectos
validates :nombre, :uniqueness => { :message => 'No pueden existir dos regionales con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
validates :domicilio, :presence => true, :length => { :maximum => 250 }
validates :telefono_contacto, :presence => true, :length => { :maximum => 250 }
validates :nombre_contacto, :presence => true, :length => { :maximum => 250 }
end
