json.array!(@regionales) do |regional|
  json.extract! regional, :id, :nombre, :domicilio, :telefono_contacto, :nombre_contacto
  json.url regional_url(regional, format: :json)
end
