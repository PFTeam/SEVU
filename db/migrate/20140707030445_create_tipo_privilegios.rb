class CreateTipoPrivilegios < ActiveRecord::Migration
  def change
    create_table :tipo_privilegios do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
