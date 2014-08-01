class EstadoPresupuesto < ActiveRecord::Base

  has_many :historial_estado_presupuestos

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, presence => true
end
