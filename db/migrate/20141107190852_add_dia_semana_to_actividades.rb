class AddDiaSemanaToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :dia_semana, :string
  end
end
