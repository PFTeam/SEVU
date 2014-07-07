json.array!(@tipo_actividades) do |tipo_actividad|
  json.extract! tipo_actividad, :id, :titulo, :descripcion
  json.url tipo_actividad_url(tipo_actividad, format: :json)
end
