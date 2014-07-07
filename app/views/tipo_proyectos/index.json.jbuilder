json.array!(@tipo_proyectos) do |tipo_proyecto|
  json.extract! tipo_proyecto, :id, :nombre, :descripcion
  json.url tipo_proyecto_url(tipo_proyecto, format: :json)
end
