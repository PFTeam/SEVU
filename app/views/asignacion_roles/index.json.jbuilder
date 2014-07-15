json.array!(@asignacion_roles) do |asignacion_rol|
  json.extract! asignacion_rol, :id, :fechaCambioEstado, :esActual, :rol_id, :proyecto_id, :usuario_id
  json.url asignacion_rol_url(asignacion_rol, format: :json)
end
