class CreateTipoHabilidades < ActiveRecord::Migration
  def change
    create_table :tipo_habilidades do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
