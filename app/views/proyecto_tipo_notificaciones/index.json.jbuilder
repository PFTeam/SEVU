json.array!(@proyecto_tipo_notificaciones) do |proyecto_tipo_notificacion|
  json.extract! proyecto_tipo_notificacion, :id, :proyecto_id, :tipo_notificacion_id
  json.url proyecto_tipo_notificacion_url(proyecto_tipo_notificacion, format: :json)
end
