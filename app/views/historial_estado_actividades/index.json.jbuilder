json.array!(@historial_estado_actividades) do |historial_estado_actividad|
  json.extract! historial_estado_actividad, :id, :fechaCambioEstado, :esActual, :actividad_id, :estado_actividad_id
  json.url historial_estado_actividad_url(historial_estado_actividad, format: :json)
end
