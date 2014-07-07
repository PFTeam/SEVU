json.array!(@restricciones) do |restriccion|
  json.extract! restriccion, :id, :fechaDesde, :fechaHasta, :esActiva, :tipo_proyecto_id
  json.url restriccion_url(restriccion, format: :json)
end
