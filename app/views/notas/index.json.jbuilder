json.array!(@notas) do |nota|
  json.extract! nota, :id, :titulo, :descripcion, :fechaCreacion, :voluntario_id, :usuario_id
  json.url nota_url(nota, format: :json)
end
