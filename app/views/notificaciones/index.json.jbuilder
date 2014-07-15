json.array!(@notificaciones) do |notificacion|
  json.extract! notificacion, :id, :fechaNotificacion, :horaNotificacion, :esActiva, :mensaje, :notificado, :usuarioCreador_id, :usuarioDestino_id, :evento_publico_id, :proyecto_id
  json.url notificacion_url(notificacion, format: :json)
end
