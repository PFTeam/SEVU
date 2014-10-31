class RemoveFechaRegistroToUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :fechaRegistro, :datetime
  end
end
