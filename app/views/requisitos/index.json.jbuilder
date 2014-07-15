json.array!(@requisitos) do |requisito|
  json.extract! requisito, :id, :actividad_id, :habilidad_id
  json.url requisito_url(requisito, format: :json)
end
