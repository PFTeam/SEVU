class CreatePostulaciones < ActiveRecord::Migration
  def change
    create_table :postulaciones do |t|
      t.datetime :fechaPostulacion
      t.boolean :aceptado
      t.references :proyecto, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
