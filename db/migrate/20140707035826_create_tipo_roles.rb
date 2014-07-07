class CreateTipoRoles < ActiveRecord::Migration
  def change
    create_table :tipo_roles do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
