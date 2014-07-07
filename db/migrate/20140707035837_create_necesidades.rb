class CreateNecesidades < ActiveRecord::Migration
  def change
    create_table :necesidades do |t|
      t.text :descripcion
      t.date :fechaCreacion
      t.text :ambitoAplicacion
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
