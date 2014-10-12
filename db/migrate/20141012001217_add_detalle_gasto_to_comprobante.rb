class AddDetalleGastoToComprobante < ActiveRecord::Migration
  def change
    add_column :comprobantes, :detalle_gasto_id, :integer
    add_index :comprobantes, :detalle_gasto_id
  end
end
