json.array!(@habilidades) do |habilidad|
  json.extract! habilidad, :id, :nombre, :descripcion, :tipo_habilidad_id
  json.informal [habilidad.nombre, habilidad.tipo_habilidad].reject(&:blank?).join ' | '
  json.url habilidad_url(habilidad, format: :json)
end
