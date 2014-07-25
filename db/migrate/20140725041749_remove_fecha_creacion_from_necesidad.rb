class RemoveFechaCreacionFromNecesidad < ActiveRecord::Migration
  def change
    remove_column :necesidades, :fechaCreacion, :datatime
  end
end
