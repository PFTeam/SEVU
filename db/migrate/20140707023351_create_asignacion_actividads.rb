class CreateAsignacionActividads < ActiveRecord::Migration
  def change
    create_table :asignacion_actividads do |t|
      t.boolean :vigente
      t.date :fechaAsignacion
      t.references :actividad, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
