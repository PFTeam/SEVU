class CreateNotaPersonales < ActiveRecord::Migration
  def change
    create_table :nota_personales do |t|
      t.string :titulo
      t.text :descripcion
      t.date :fechaCreacion
      t.references :voluntario, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
