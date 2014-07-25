class RemoveFechaCreacionFromAsistenciaEvento < ActiveRecord::Migration
  def change
    remove_column :asistencia_eventos, :fechaCreacion, :datatime
  end
end
