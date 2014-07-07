class CreateHorarioDisponibles < ActiveRecord::Migration
  def change
    create_table :horario_disponibles do |t|
      t.string :diaSemana
      t.date :horaDesde
      t.date :horaHasta
      t.references :voluntario, index: true

      t.timestamps
    end
  end
end
