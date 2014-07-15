json.array!(@tipo_notificaciones) do |tipo_notificacion|
  json.extract! tipo_notificacion, :id, :nombre
  json.url tipo_notificacion_url(tipo_notificacion, format: :json)
end
