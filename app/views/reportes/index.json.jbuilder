json.array!(@reportes) do |reporte|
  json.extract! reporte, :id, :fechaCreacion, :descripcion, :asignacion_actividad_id
  json.url reporte_url(reporte, format: :json)
end
