class EstadoUsuario < ActiveRecord::Base

  #has_many :historial_estado_usuarios
  #has_many :usuarios, :through => :historial_estado_usuarios

# validates :nombre,
#  :uniqueness => { 
#    :message => 'No pueden existir dos Estados con el mismo nombre',
#   :case_sensitive => false  }, 
#   :length => { :maximum => 250 },
#   :presence => true
 
# validates :descripcion, :presence => true, :case_sensitive => false,
   #:length => { :maximum => 250 }

end
