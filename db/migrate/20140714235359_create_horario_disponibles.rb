class CreateHorarioDisponibles < ActiveRecord::Migration
  def change
    create_table :horario_disponibles do |t|
      t.string :diaSemana
      t.time :horaDesde
      t.time :horaHasta
      t.references :voluntario, index: true

      t.timestamps
    end
  end
end
