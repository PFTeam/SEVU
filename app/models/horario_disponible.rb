class HorarioDisponible < ActiveRecord::Base
  belongs_to :voluntario
  
   validates :diaSemana,:horaDesde,:horaHasta,:voluntario_id, presence: true

end

