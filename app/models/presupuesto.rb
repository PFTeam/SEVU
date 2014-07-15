class Presupuesto < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :restriccion
  belongs_to :usuario

  has_many :historial_estado_presupuestos
  has_many :detalle_presupuestos


end
