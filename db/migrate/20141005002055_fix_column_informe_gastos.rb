class FixColumnInformeGastos < ActiveRecord::Migration
  def change
    rename_column :detalle_gastos, :informe_gastos_id, :informe_gasto_id
  end
end
