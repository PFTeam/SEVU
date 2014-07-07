class CreateAsignacionRolPredefinidos < ActiveRecord::Migration
  def change
    create_table :asignacion_rol_predefinidos do |t|
      t.date :fechaAsignacion
      t.boolean :esActual
      t.references :privilegio, index: true
      t.references :rol, index: true

      t.timestamps
    end
  end
end
