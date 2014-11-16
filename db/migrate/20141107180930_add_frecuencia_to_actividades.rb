class AddFrecuenciaToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :frecuencia, :string
  end
end
