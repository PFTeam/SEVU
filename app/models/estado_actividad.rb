class EstadoActividad < ActiveRecord::Base

  has_many :historial_estado_actividades
  has_many :actividades, :through => :historial_estado_actividades

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }
end
