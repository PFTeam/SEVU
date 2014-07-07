class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.date :fechaPresentacion
      t.integer :montoTotal
      t.boolean :aprobado
      t.references :proyecto, index: true
      t.references :restriccion, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
