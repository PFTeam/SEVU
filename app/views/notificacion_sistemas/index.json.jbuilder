json.array!(@notificacion_sistemas) do |notificacion_sistema|
  json.extract! notificacion_sistema, :id
  json.url notificacion_sistema_url(notificacion_sistema, format: :json)
end
