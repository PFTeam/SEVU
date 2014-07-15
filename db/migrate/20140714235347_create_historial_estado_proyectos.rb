class CreateHistorialEstadoProyectos < ActiveRecord::Migration
  def change
    create_table :historial_estado_proyectos do |t|
      t.datetime :fechaCambioEstado
      t.boolean :esActual
      t.references :estado_proyecto, index: true
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
