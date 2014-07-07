json.array!(@privilegios) do |privilegio|
  json.extract! privilegio, :id, :nombre, :descripcion, :tipo_privilegio_id
  json.url privilegio_url(privilegio, format: :json)
end
