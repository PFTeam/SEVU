json.array!(@notificacion_emailes) do |notificacion_email|
  json.extract! notificacion_email, :id, :destinatario, :remitente, :asunto
  json.url notificacion_email_url(notificacion_email, format: :json)
end
