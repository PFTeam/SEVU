class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
      t.string :titulo
      t.text :descripcion
      t.datetime :fechaCreacion
      t.references :voluntario, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
