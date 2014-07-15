class CreateEventoPublicos < ActiveRecord::Migration
  def change
    create_table :evento_publicos do |t|
      t.string :nombre
      t.text :descripcion
      t.datetime :fechaRealizacion
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
