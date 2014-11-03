class CreateRegionales < ActiveRecord::Migration
  def change
    create_table :regionales do |t|
      t.string :nombre
      t.string :domicilio
      t.integer :telefono_contacto
      t.string :nombre_contacto

      t.timestamps
    end
  end
end
