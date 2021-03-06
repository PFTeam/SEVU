class Presupuesto < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :restriccion
  belongs_to :usuario

  has_many :historial_estado_presupuestos
  has_many :estado_presupuestos, :through => :historial_estado_presupuestos

  has_many :detalle_presupuestos
  has_many :concepto_gastos, :through => :detalle_presupuestos
  
  # TODO Agregar validaciones de usuario cuando este implementada la funcionalidad
  
  validates_presence_of :proyecto, message: "es un campo obligatorio"

end
