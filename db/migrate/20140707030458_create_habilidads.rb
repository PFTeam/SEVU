class CreateHabilidads < ActiveRecord::Migration
  def change
    create_table :habilidads do |t|
      t.string :nombre
      t.text :descripcion
      t.references :tipo_habilidad, index: true

      t.timestamps
    end
  end
end
