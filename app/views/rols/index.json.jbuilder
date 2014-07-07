json.array!(@rols) do |rol|
  json.extract! rol, :id, :nombre, :descripcion, :tipo_rol_id
  json.url rol_url(rol, format: :json)
end
