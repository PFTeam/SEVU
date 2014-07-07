class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombreUsuario
      t.string :contrasenia
      t.string :apellidoNombre
      t.string :email
      t.string :direccion
      t.date :fechaRegistro

      t.timestamps
    end
  end
end
