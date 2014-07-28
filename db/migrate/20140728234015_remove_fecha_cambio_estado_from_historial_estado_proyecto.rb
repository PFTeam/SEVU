class RemoveFechaCambioEstadoFromHistorialEstadoProyecto < ActiveRecord::Migration
  def change
    remove_column :historial_estado_proyectos, :fechaCambioEstado, :datetime
  end
end
