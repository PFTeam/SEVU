json.array!(@asignacion_rol_sistemas) do |asignacion_rol_sistema|
  json.extract! asignacion_rol_sistema, :id, :fechaAsignacion, :esActual, :descripcion, :usuario_id, :rol_id
  json.url asignacion_rol_sistema_url(asignacion_rol_sistema, format: :json)
end
