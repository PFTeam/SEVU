class RemoveEsActualFromHistorialEstadoProyecto < ActiveRecord::Migration
  def change
    remove_column :historial_estado_proyectos, :esActual, :boolean
  end
end
