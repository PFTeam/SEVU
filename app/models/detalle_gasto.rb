class DetalleGasto < ActiveRecord::Base
  belongs_to :concepto_gasto
  belongs_to :informe_gastos
  belongs_to :voluntario
  belongs_to :comprobante

  validates :monto,
      :presence => true,
      :numericality => {
        :greater_than => 0,
        :message => "No puede ser un monto negativo"}

  validates_length_of :titulo,
      :presence => true,
      :maximum => 255,
      :allow_blank => false

  validates :descripcion,
      :presence => true,
      :allow_blank => false

end
