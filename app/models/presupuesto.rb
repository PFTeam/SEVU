class Presupuesto < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :restriccion
  belongs_to :usuario

  has_many :historial_estado_presupuestos
  has_many :estado_presupuestos, :through => :historial_estado_presupuestos

  has_many :detalle_presupuestos
  has_many :concepto_gastos, :through => :detalle_presupuestos

  def estado_actual #Devuelve el estado actual del proyecto
    #no esta terminado porque faltan atributos importantes
  end

  def monto_total
    detalle_presupuestos.sum(:monto)
  end
end
