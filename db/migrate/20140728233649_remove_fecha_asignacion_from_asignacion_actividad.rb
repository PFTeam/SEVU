class RemoveFechaAsignacionFromAsignacionActividad < ActiveRecord::Migration
  def change
    remove_column :asignacion_actividades, :fechaAsignacion, :datetime
  end
end
