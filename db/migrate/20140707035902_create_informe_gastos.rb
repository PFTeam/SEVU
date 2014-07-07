class CreateInformeGastos < ActiveRecord::Migration
  def change
    create_table :informe_gastos do |t|
      t.float :montoTotal
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
