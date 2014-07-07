class CreateActividadHabilidads < ActiveRecord::Migration
  def change
    create_table :actividad_habilidads do |t|
      t.references :actividad, index: true
      t.references :habilidad, index: true

      t.timestamps
    end
  end
end
