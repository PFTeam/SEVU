class Restriccion < ActiveRecord::Base
  belongs_to :tipo_proyecto

  has_many :detalle_restricciones
  has_many :concepto_gastos, :through => :detalle_restricciones
  
  has_many :presupuestos

  validates_presence_of :tipo_proyecto, message: "es un campo obligatorio"
  validates_uniqueness_of :tipo_proyecto, message: "- Ya existen restricciones para ese Tipo de Proyecto"

end
