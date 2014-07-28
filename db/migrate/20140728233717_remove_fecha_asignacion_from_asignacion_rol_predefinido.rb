class RemoveFechaAsignacionFromAsignacionRolPredefinido < ActiveRecord::Migration
  def change
    remove_column :asignacion_rol_predefinidos, :fechaAsignacion, :datetime
  end
end
