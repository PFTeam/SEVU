class CreateActividadHabilidades < ActiveRecord::Migration
  def change
    create_table :actividad_habilidades do |t|
      t.references :actividad, index: true
      t.references :habilidad, index: true

      t.timestamps
    end
  end
end
