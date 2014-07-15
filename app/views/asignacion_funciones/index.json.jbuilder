json.array!(@asignacion_funciones) do |asignacion_funcion|
  json.extract! asignacion_funcion, :id, :fechaAsignacion, :esActual, :descripcion, :usuario_id, :rol_id
  json.url asignacion_funcion_url(asignacion_funcion, format: :json)
end
