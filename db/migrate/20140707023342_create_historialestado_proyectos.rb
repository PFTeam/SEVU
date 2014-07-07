class CreateHistorialestadoProyectos < ActiveRecord::Migration
  def change
    create_table :historialestado_proyectos do |t|
      t.date :fechaCambioEstado
      t.boolean :esActual
      t.references :estado_proyecto, index: true
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
