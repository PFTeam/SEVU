class AddDescripcionToEstadoActividad < ActiveRecord::Migration
  def change
    add_column :estado_actividades, :descripcion, :string
  end
end
