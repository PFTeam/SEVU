class CreateAsignacionActividades < ActiveRecord::Migration
  def change
    create_table :asignacion_actividades do |t|
      t.boolean :vigente
      t.datetime :fechaAsignacion
      t.references :actividad, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
