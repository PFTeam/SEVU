class AddActiveToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :active, :boolean
  end
end
