json.array!(@historial_estado_usuarios) do |historial_estado_usuario|
  json.extract! historial_estado_usuario, :id, :fechaCambioEstado, :esActual, :usuario_id, :estado_usuario_id
  json.url historial_estado_usuario_url(historial_estado_usuario, format: :json)
end
