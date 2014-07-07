class CreateHistorialEstadoActividads < ActiveRecord::Migration
  def change
    create_table :historial_estado_actividads do |t|
      t.date :fechaCambioEstado
      t.boolean :esActual
      t.references :actividad, index: true
      t.references :estado_actividad, index: true

      t.timestamps
    end
  end
end
