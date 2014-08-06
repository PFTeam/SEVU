class OrganizacionExterna < ActiveRecord::Base
  validates :denominacion, :uniqueness => { :message => 'No pueden existir dos organizaciones con la misma denominación', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :cuit, :uniqueness => {:message => 'No pueden existir dos organizaciones con el mismo cuit'} #TODO: validar formato cuit
  validates :direccion, :length => { :maximum => 250 }
  validates :fax, :length => { :maximum => 250 }
  validates :telefono, :length => { :maximum => 250 }
  validates :nombreResponsable, :length => { :maximum => 250 }
  validates :cargoResponsable, :length => { :maximum => 250 }
  validates :numeroContactoResponsable, :length => { :maximum => 250 }
end
