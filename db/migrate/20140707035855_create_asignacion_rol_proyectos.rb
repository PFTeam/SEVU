class CreateAsignacionRolProyectos < ActiveRecord::Migration
  def change
    create_table :asignacion_rol_proyectos do |t|
      t.date :fechaCambioEstado
      t.boolean :esActual
      t.references :rol, index: true
      t.references :proyecto, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
