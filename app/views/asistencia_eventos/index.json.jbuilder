json.array!(@asistencia_eventos) do |asistencia_evento|
  json.extract! asistencia_evento, :id, :fechaCreacion, :evento_publico_id, :usuario_id
  json.url asistencia_evento_url(asistencia_evento, format: :json)
end
