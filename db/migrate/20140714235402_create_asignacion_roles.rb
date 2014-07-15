class CreateAsignacionRoles < ActiveRecord::Migration
  def change
    create_table :asignacion_roles do |t|
      t.datetime :fechaCambioEstado
      t.boolean :esActual
      t.references :rol, index: true
      t.references :proyecto, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
