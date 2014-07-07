json.array!(@organizacion_externa_proyectos) do |organizacion_externa_proyecto|
  json.extract! organizacion_externa_proyecto, :id, :organizacion_externa_id, :proyecto_id
  json.url organizacion_externa_proyecto_url(organizacion_externa_proyecto, format: :json)
end
