json.array!(@organizacion_externas) do |organizacion_externa|
  json.extract! organizacion_externa, :id, :sigla, :denominacion, :cuit, :direccion, :fax, :telefono, :nombreResponsable, :cargoResponsable, :numeroContactoResponsable
  json.url organizacion_externa_url(organizacion_externa, format: :json)
end
