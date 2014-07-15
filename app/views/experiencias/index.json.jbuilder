json.array!(@experiencias) do |experiencia|
  json.extract! experiencia, :id, :tieneExperiencia, :cantidadExperiencia, :habilidad_id, :voluntario_id
  json.url experiencia_url(experiencia, format: :json)
end
