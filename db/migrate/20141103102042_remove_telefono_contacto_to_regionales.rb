class RemoveTelefonoContactoToRegionales < ActiveRecord::Migration
  def change
    remove_column :regionales, :telefono_contacto, :integer
  end
end
