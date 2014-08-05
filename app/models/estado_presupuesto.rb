class EstadoPresupuesto < ActiveRecord::Base

  has_many :historial_estado_presupuestos

  validates :nombre,
      :presence => true,
      :allow_blank => false,
      :uniqueness => {
        :message => 'No pueden existir dos Estados con el mismo nombre',
        :case_sensitive => false  }, 
      :length => { :maximum => 255 }
  
  validates :descripcion, 
      :presence => true, 
      :length => { :maximum => 250 }

end
