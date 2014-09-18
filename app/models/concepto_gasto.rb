class ConceptoGasto < ActiveRecord::Base

  has_many :detalle_restricciones
  has_many :restricciones, :through => :detalle_restricciones
  has_many :detalle_presupuestos
  has_many :presupuestos, :through => :detalle_presupuestos
  has_many :detalle_gastos
  has_many :informe_gastos, :through => :detalle_gastos

  validates :titulo,
      :presence => true,
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"},
      #length => {:maximum => 255},
      :allow_blank => false,
      :uniqueness => {
        :message => "No pueden existir dos Conceptos con el mismo titulo",
        :case_sensitive => false}

  validates :descripcion,
      :presence => true,
      :allow_blank => false

end
