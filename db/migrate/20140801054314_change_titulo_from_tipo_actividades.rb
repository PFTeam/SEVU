class ChangeTituloFromTipoActividades < ActiveRecord::Migration
  def change
    rename_column :tipo_actividades, :titulo, :nombre
  end
end
