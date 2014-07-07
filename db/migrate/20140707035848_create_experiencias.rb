class CreateExperiencias < ActiveRecord::Migration
  def change
    create_table :experiencias do |t|
      t.boolean :tieneExperiencia
      t.integer :cantidadExperiencia
      t.references :habilidad, index: true
      t.references :voluntario, index: true

      t.timestamps
    end
  end
end
