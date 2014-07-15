class CreateAsignacionFunciones < ActiveRecord::Migration
  def change
    create_table :asignacion_funciones do |t|
      t.datetime :fechaAsignacion
      t.boolean :esActual
      t.text :descripcion
      t.references :usuario, index: true
      t.references :rol, index: true

      t.timestamps
    end
  end
end
