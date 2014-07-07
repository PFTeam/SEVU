class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.date :fechaCreacion
      t.text :descripcion
      t.references :asignacion_actividad, index: true

      t.timestamps
    end
  end
end
