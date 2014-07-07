class CreateHistorialEstadoUsuarios < ActiveRecord::Migration
  def change
    create_table :historial_estado_usuarios do |t|
      t.date :fechaCambioEstado
      t.boolean :esActual
      t.references :usuario, index: true
      t.references :estado_usuario, index: true

      t.timestamps
    end
  end
end
