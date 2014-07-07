class CreateHistorialEstadoActividades < ActiveRecord::Migration
  def change
    create_table :historial_estado_actividades do |t|
      t.date :fechaCambioEstado
      t.boolean :esActual
      t.references :actividad, index: true
      t.references :estado_actividad, index: true

      t.timestamps
    end
  end
end
