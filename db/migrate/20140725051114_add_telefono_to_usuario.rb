class AddTelefonoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :telefono, :string
  end
end
