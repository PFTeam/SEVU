json.array!(@actividad_habilidades) do |actividad_habilidad|
  json.extract! actividad_habilidad, :id, :actividad_id, :habilidad_id
  json.url actividad_habilidad_url(actividad_habilidad, format: :json)
end
