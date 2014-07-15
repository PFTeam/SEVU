json.array!(@historial_estado_proyectos) do |historial_estado_proyecto|
  json.extract! historial_estado_proyecto, :id, :fechaCambioEstado, :esActual, :estado_proyecto_id, :proyecto_id
  json.url historial_estado_proyecto_url(historial_estado_proyecto, format: :json)
end
