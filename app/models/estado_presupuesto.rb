class EstadoPresupuesto < ActiveRecord::Base

  has_many :historial_estado_presupuestos

  before_destroy :puede_destruirse?

#  validates :nombre,
##      :presence => true,
#      :allow_blank => false,
#      :uniqueness => {
#        :message => 'No pueden existir dos Estados con el mismo nombre',
#        :case_sensitive => false  }, 
#      :length => { :maximum => 255 }
  
#  validates :descripcion, 
#      :presence => true, 
#      :length => { :maximum => 250 }

  validates :nombre,
    :length => {
      :maximum => 255,
      :message => "- tiene demasiados caracteres (maximo 255)"},
    :uniqueness => {
        :message => " - no pueden existir dos estados con el mismo nombre",
        :case_sensitive => false}

  validates_presence_of :nombre, :descripcion, message: "- es un campo obligatorio"

  def puede_destruirse?
    if !historial_estado_presupuestos.empty? then
      errors.add :base, 'No puede eliminarse debido a que presupuestos han tenido este estado'
      return false
    else
      return true
    end
  end

end
