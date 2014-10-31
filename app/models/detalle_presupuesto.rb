class DetallePresupuesto < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :concepto_gasto
  
  validates_presence_of :monto, :titulo, :descripcion, message: "es un campo obligatorio"
  
  validate :cumple_restricciones

  validates :monto,
      :numericality => {
        :greater_than => 0,
        :message => "no puede ser negativo"}

  validates :titulo,
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"}

     def cumple_restricciones
        ## Esta validacion compara la suma de los montos de un concepto de gasto particular del presupuesto (incluida la suma ingresada)
        ## con la restriccion de el concepto especificado
        if concepto_gasto.restriccion.nil? then
          return true #no hay restriccion
        else #si hay restriccion
          if (presupuesto.detalle_presupuestos.where(concepto_gasto_id: concepto_gasto.id).sum(:monto) + monto) > concepto_gasto.restriccion.montoMax then
              errors.add :base, 'El monto total para el Concepto seleccionado superaría una restriccion de gasto, cuyo valor máximo es de $'+concepto_gasto.restriccion.montoMax.to_s
              return false #es mayor a la restriccion
          else
              return true #no es mayor a la restriccion
          end
        end
     end

end
