class CreateAsistenciaEventoPublicos < ActiveRecord::Migration
  def change
    create_table :asistencia_evento_publicos do |t|
      t.date :fechaCreacion
      t.references :evento_publico, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
