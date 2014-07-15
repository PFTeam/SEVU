class CreateDetallePresupuestos < ActiveRecord::Migration
  def change
    create_table :detalle_presupuestos do |t|
      t.string :titulo
      t.text :descripcion
      t.float :monto
      t.references :presupuesto, index: true
      t.references :concepto_gasto, index: true

      t.timestamps
    end
  end
end
