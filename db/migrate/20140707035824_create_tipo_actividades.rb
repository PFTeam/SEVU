class CreateTipoActividades < ActiveRecord::Migration
  def change
    create_table :tipo_actividades do |t|
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
