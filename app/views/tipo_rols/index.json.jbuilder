json.array!(@tipo_rols) do |tipo_rol|
  json.extract! tipo_rol, :id, :nombre, :descripcion
  json.url tipo_rol_url(tipo_rol, format: :json)
end
