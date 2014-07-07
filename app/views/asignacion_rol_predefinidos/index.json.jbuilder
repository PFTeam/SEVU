json.array!(@asignacion_rol_predefinidos) do |asignacion_rol_predefinido|
  json.extract! asignacion_rol_predefinido, :id, :fechaAsignacion, :esActual, :privilegio_id, :rol_id
  json.url asignacion_rol_predefinido_url(asignacion_rol_predefinido, format: :json)
end
