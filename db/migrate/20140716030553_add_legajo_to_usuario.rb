class AddLegajoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :legajo, :integer
  end
end
