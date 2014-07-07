json.array!(@tipo_habilidads) do |tipo_habilidad|
  json.extract! tipo_habilidad, :id, :nombre, :descripcion
  json.url tipo_habilidad_url(tipo_habilidad, format: :json)
end
