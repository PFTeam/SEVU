class AddEvaluadoToPresupuesto < ActiveRecord::Migration
  def change
  	add_column :presupuestos, :evaluado, :boolean, :default => false
  end
end
