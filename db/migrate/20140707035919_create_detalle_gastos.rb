class CreateDetalleGastos < ActiveRecord::Migration
  def change
    create_table :detalle_gastos do |t|
      t.string :titulo
      t.text :descripcion
      t.float :monto
      t.references :concepto_gasto, index: true
      t.references :informe_gastos, index: true
      t.references :voluntario, index: true
      t.references :comprobante, index: true

      t.timestamps
    end
  end
end
