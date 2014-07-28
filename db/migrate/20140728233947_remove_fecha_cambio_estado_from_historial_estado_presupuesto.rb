class RemoveFechaCambioEstadoFromHistorialEstadoPresupuesto < ActiveRecord::Migration
  def change
    remove_column :historial_estado_presupuestos, :fechaCambioEstado, :datetime
  end
end
