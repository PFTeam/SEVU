class DetalleRestriccion < ActiveRecord::Base
  belongs_to :restriccion
  belongs_to :concepto_gasto
  after_initialize :default_values

  validates_presence_of :restriccion, :concepto_gasto, :montoMax, message: "es un campo obligatorio"

  validates :montoMax,
      :numericality => {
        :greater_than => 0,
        :message => "no puede ser negativo"}

  validates :concepto_gasto, uniqueness: {
      scope: :restriccion,
      conditions: -> { where(esActiva: true) },
      message: "- Solo debe haber una restriccion activa por Concepto" }

  private

  def default_values
    self.esActiva ||= true
    self.fechaDesde ||= Date.today
  end
end
