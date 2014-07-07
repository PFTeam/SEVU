class CreateNecesidads < ActiveRecord::Migration
  def change
    create_table :necesidads do |t|
      t.text :descripcion
      t.date :fechaCreacion
      t.text :ambitoAplicacion
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
