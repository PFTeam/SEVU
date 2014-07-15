json.array!(@reportes) do |report|
  json.extract! report, :id, :fechaCreacion, :descripcion, :asignacion_actividad_id
  json.url report_url(report, format: :json)
end
