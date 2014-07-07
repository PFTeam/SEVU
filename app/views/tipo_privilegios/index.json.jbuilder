json.array!(@tipo_privilegios) do |tipo_privilegio|
  json.extract! tipo_privilegio, :id, :nombre, :descripcion
  json.url tipo_privilegio_url(tipo_privilegio, format: :json)
end
