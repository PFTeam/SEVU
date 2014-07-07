class CreateEstadoActividades < ActiveRecord::Migration
  def change
    create_table :estado_actividades do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
