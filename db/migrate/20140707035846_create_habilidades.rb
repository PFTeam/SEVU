class CreateHabilidades < ActiveRecord::Migration
  def change
    create_table :habilidades do |t|
      t.string :nombre
      t.text :descripcion
      t.references :tipo_habilidad, index: true

      t.timestamps
    end
  end
end
