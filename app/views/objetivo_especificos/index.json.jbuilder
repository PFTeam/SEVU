json.array!(@objetivo_especificos) do |objetivo_especifico|
  json.extract! objetivo_especifico, :id, :titulo, :descripcion, :objetivo_general_id
  json.url objetivo_especifico_url(objetivo_especifico, format: :json)
end
