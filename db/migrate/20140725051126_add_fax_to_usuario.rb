class AddFaxToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :fax, :string
  end
end
