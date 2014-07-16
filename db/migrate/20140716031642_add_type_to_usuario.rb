class AddTypeToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :type, :string
  end
end
