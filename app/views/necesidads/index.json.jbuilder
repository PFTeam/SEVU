json.array!(@necesidads) do |necesidad|
  json.extract! necesidad, :id, :descripcion, :fechaCreacion, :ambitoAplicacion, :usuario_id
  json.url necesidad_url(necesidad, format: :json)
end
