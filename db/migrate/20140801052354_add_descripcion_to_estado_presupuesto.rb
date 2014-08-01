class AddDescripcionToEstadoPresupuesto < ActiveRecord::Migration
  def change
    add_column :estado_presupuestos, :descripcion, :string
  end
end
