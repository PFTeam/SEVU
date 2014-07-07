class CreateDetalleRestriccions < ActiveRecord::Migration
  def change
    create_table :detalle_restriccions do |t|
      t.boolean :esActiva
      t.date :fechaDesde
      t.date :fechaHasta
      t.float :montoMax
      t.references :restriccion, index: true
      t.references :concepto_gasto, index: true

      t.timestamps
    end
  end
end
