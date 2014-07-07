class CreateTipoHabilidads < ActiveRecord::Migration
  def change
    create_table :tipo_habilidads do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
