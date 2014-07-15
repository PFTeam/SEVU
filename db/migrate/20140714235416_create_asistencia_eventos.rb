class CreateAsistenciaEventos < ActiveRecord::Migration
  def change
    create_table :asistencia_eventos do |t|
      t.datetime :fechaCreacion
      t.references :evento_publico, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
