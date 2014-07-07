json.array!(@objetivo_generals) do |objetivo_general|
  json.extract! objetivo_general, :id, :titulo, :description, :proyecto_id
  json.url objetivo_general_url(objetivo_general, format: :json)
end
