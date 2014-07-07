class CreateTipoRols < ActiveRecord::Migration
  def change
    create_table :tipo_rols do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
