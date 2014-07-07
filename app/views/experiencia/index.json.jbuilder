json.array!(@experiencia) do |experiencium|
  json.extract! experiencium, :id, :tieneExperiencia, :cantidadExperiencia, :habilidad_id, :voluntario_id
  json.url experiencium_url(experiencium, format: :json)
end
