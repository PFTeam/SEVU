class RemoveComprobantesFromDetalleGastos < ActiveRecord::Migration
  def change
    remove_index :detalle_gastos, column: :comprobante_id
    remove_column :detalle_gastos, :comprobante_id
  end
end
