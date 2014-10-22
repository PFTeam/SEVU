class Restriccion < ActiveRecord::Base
  #belongs_to :tipo_proyecto
  belongs_to :concepto_gasto
  #has_many :detalle_restricciones
  #has_many :concepto_gastos#, :through => :detalle_restricciones
    after_initialize :default_values
  #has_many :presupuestos

  validates :montoMax,
      :numericality => {
        :greater_than => 0,
        :message => "no puede ser negativo"} unless :montoMax == nil 

  #validates :concepto_gasto, uniqueness: {
   #   conditions: -> { where(esActiva: true) },
    #  message: "- Solo debe haber una restriccion activa por Concepto" }

    # validates :concepto_gasto, uniqueness: {
    #   scope: :esActiva,
    #   message: "- Solo debe haber una restriccion activa por Concepto" }

  validates_uniqueness_of :concepto_gasto, message: "- Solo puede haber una restriccion por cada Concepto de gasto"

  validates_presence_of :montoMax, :concepto_gasto, message: "es un campo obligatorio"

  #validates_presence_of :tipo_proyecto, message: "es un campo obligatorio"
  #validates_uniqueness_of :tipo_proyecto, message: "- Ya existen restricciones para ese Tipo de Proyecto"
  private

  def default_values
    self.esActiva = true if self.esActiva.nil?
   # self.fechaDesde ||=   Date.today
  end
end
