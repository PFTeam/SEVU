json.array!(@estado_actividades) do |estado_actividad|
  json.extract! estado_actividad, :id, :nombre
  json.url estado_actividad_url(estado_actividad, format: :json)
end
