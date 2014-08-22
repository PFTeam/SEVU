json.array!(@organizacion_externas) do |organizacion_externa|
  json.extract! organizacion_externa, :id, :sigla, :denominacion
  json.informal [organizacion_externa.sigla, organizacion_externa.denominacion].reject(&:blank?).join ' | '
  json.url organizacion_externa_url(organizacion_externa, format: :json)
end
