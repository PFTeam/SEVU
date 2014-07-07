json.array!(@historialestado_proyectos) do |historialestado_proyecto|
  json.extract! historialestado_proyecto, :id, :fechaCambioEstado, :esActual, :estado_proyecto_id, :proyecto_id
  json.url historialestado_proyecto_url(historialestado_proyecto, format: :json)
end
