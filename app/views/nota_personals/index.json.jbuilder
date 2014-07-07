json.array!(@nota_personals) do |nota_personal|
  json.extract! nota_personal, :id, :titulo, :descripcion, :fechaCreacion, :voluntario_id, :usuario_id
  json.url nota_personal_url(nota_personal, format: :json)
end
