json.array!(@necesidades) do |necesidad|
  json.extract! necesidad, :id, :titulo, :descripcion
  json.informal [necesidad.descripcion].reject(&:blank?).join ' | '
  json.url necesidad_url(necesidad, format: :json)
end
