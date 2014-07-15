json.array!(@notificacion_predeterminadas) do |notificacion_predeterminada|
  json.extract! notificacion_predeterminada, :id, :proyecto_id, :tipo_notificacion_id
  json.url notificacion_predeterminada_url(notificacion_predeterminada, format: :json)
end
