class CreatePrivilegios < ActiveRecord::Migration
  def change
    create_table :privilegios do |t|
      t.string :nombre
      t.text :descripcion
      t.references :tipo_privilegio, index: true

      t.timestamps
    end
  end
end
