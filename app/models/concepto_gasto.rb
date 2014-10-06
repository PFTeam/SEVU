class ConceptoGasto < ActiveRecord::Base

  has_many :detalle_restricciones
  has_many :restricciones, :through => :detalle_restricciones
  has_many :detalle_presupuestos
  has_many :presupuestos, :through => :detalle_presupuestos
  has_many :detalle_gastos
  has_many :informe_gastos, :through => :detalle_gastos

  before_destroy :tiene_restricciones?, :tiene_detalle_p?, :tiene_detalle_g?

  def tiene_restricciones?
    if !detalle_restricciones.empty? then
      errors.add :base, 'No puede eliminarse debido a que existen restricciones que lo utilizan'
      return false
    else
      return true
    end
  end

  def tiene_detalle_p?
    if !detalle_presupuestos.empty? then
      errors.add :base, 'No puede eliminarse debido a que existen detalles de Presupuestos que lo utilizan'
      return false
    else
      return true
    end
  end

  def tiene_detalle_g?
    if !detalle_gastos.empty? then
      errors.add :base, 'No puede eliminarse debido a que existen detalles de Gastos que lo utilizan'
      return false
    else
      return true
    end
  end
    


  validates_presence_of :titulo, :descripcion, message: "- es un campo obligatorio"


  validates :titulo,
      #:presence => true,
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"},
      #length => {:maximum => 255},
#      :allow_blank => false,
      :uniqueness => {
        :message => "No pueden existir dos Conceptos con el mismo titulo",
        :case_sensitive => false}

  #validates :descripcion,
      #:presence => true,
      #:allow_blank => false

  #validates_presence_of :titulo, :descripcion, message: "- es un campo obligatorio"

end
