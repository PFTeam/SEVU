class CreateConceptoGastos < ActiveRecord::Migration
  def change
    create_table :concepto_gastos do |t|
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
