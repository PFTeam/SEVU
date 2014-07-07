class CreateAsignacionRolSistemas < ActiveRecord::Migration
  def change
    create_table :asignacion_rol_sistemas do |t|
      t.date :fechaAsignacion
      t.boolean :esActual
      t.text :descripcion
      t.references :usuario, index: true
      t.references :rol, index: true

      t.timestamps
    end
  end
end
