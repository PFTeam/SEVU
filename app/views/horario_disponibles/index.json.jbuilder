json.array!(@horario_disponibles) do |horario_disponible|
  json.extract! horario_disponible, :id, :diaSemana, :horaDesde, :horaHasta, :voluntario_id
  json.url horario_disponible_url(horario_disponible, format: :json)
end
