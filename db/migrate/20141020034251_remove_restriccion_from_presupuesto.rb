class RemoveRestriccionFromPresupuesto < ActiveRecord::Migration
  def change
    remove_index :presupuestos, column: :restriccion_id
    remove_column :presupuestos, :restriccion_id
  end
end
