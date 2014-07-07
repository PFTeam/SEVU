class CreatePostulacionVoluntariados < ActiveRecord::Migration
  def change
    create_table :postulacion_voluntariados do |t|
      t.date :fechaPostulacion
      t.boolean :aceptado
      t.references :proyecto, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
