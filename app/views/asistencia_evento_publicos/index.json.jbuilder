json.array!(@asistencia_evento_publicos) do |asistencia_evento_publico|
  json.extract! asistencia_evento_publico, :id, :fechaCreacion, :evento_publico_id, :usuario_id
  json.url asistencia_evento_publico_url(asistencia_evento_publico, format: :json)
end
