json.array!(@asignacion_rol_proyectos) do |asignacion_rol_proyecto|
  json.extract! asignacion_rol_proyecto, :id, :fechaCambioEstado, :esActual, :rol_id, :proyecto_id, :usuario_id
  json.url asignacion_rol_proyecto_url(asignacion_rol_proyecto, format: :json)
end
