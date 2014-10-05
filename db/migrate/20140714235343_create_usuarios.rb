class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombreUsuario
      t.string :apellidoNombre
      t.string :direccion
      t.datetime :fechaRegistro

      t.timestamps
    end
  end
end
