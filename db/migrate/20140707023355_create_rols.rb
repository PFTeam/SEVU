class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.string :nombre
      t.text :descripcion
      t.references :tipo_rol, index: true

      t.timestamps
    end
  end
end
