json.array!(@estado_proyectos) do |estado_proyecto|
  json.extract! estado_proyecto, :id, :nombre
  json.url estado_proyecto_url(estado_proyecto, format: :json)
end
