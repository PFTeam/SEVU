class AddRepetitivaToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :repetitiva, :boolean
  end
end
