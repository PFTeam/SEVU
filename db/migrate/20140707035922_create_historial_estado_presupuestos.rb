class CreateHistorialEstadoPresupuestos < ActiveRecord::Migration
  def change
    create_table :historial_estado_presupuestos do |t|
      t.boolean :esActual
      t.date :fechaCambioEstado
      t.references :presupuesto, index: true
      t.references :estado_presupuesto, index: true

      t.timestamps
    end
  end
end
