class CreateNotaPersonals < ActiveRecord::Migration
  def change
    create_table :nota_personals do |t|
      t.string :titulo
      t.text :descripcion
      t.date :fechaCreacion
      t.references :voluntario, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
