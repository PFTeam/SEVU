class CreateDetalleRestricciones < ActiveRecord::Migration
  def change
    create_table :detalle_restricciones do |t|
      t.boolean :esActiva
      t.datetime :fechaDesde
      t.datetime :fechaHasta
      t.float :montoMax
      t.references :restriccion, index: true
      t.references :concepto_gasto, index: true

      t.timestamps
    end
  end
end
