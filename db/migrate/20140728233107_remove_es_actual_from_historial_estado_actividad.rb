class RemoveEsActualFromHistorialEstadoActividad < ActiveRecord::Migration
  def change
    remove_column :historial_estado_actividades, :esActual, :boolean
  end
end
