class RemoveRestriccionFromDetalleRestriccion < ActiveRecord::Migration
  def change
    remove_index :detalle_restricciones, column: :restriccion_id
    remove_column :detalle_restricciones, :restriccion_id
  end
end
