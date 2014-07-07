json.array!(@horario_disponibles) do |horario_disponibl|
  json.extract! horario_disponibl, :id, :diaSemana, :horaDesde, :horaHasta, :voluntario_id
  json.url horario_disponibl_url(horario_disponibl, format: :json)
end
