class RemoveEsActualFromHistorialEstadoPresupuesto < ActiveRecord::Migration
  def change
    remove_column :historial_estado_presupuestos, :esActual, :boolean
  end
end
