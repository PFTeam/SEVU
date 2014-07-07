json.array!(@habilidads) do |habilidad|
  json.extract! habilidad, :id, :nombre, :descripcion, :tipo_habilidad_id
  json.url habilidad_url(habilidad, format: :json)
end
