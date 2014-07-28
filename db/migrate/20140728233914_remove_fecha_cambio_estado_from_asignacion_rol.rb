class RemoveFechaCambioEstadoFromAsignacionRol < ActiveRecord::Migration
  def change
    remove_column :asignacion_roles, :fechaCambioEstado, :datetime
  end
end
