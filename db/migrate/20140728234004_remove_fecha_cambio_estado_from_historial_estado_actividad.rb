class RemoveFechaCambioEstadoFromHistorialEstadoActividad < ActiveRecord::Migration
  def change
    remove_column :historial_estado_actividades, :fechaCambioEstado, :datetime
  end
end
