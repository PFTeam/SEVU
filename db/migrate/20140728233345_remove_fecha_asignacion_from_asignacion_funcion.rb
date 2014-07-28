class RemoveFechaAsignacionFromAsignacionFuncion < ActiveRecord::Migration
  def change
    remove_column :asignacion_funciones, :fechaAsignacion, :datetime
  end
end
