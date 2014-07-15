class CreateEstadoPresupuestos < ActiveRecord::Migration
  def change
    create_table :estado_presupuestos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
