class AddTelefonoContactoToRegionales < ActiveRecord::Migration
  def change
    add_column :regionales, :telefono_contacto, :string
  end
end
