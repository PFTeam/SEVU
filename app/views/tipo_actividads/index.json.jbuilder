json.array!(@tipo_actividads) do |tipo_actividad|
  json.extract! tipo_actividad, :id, :titulo, :descripcion
  json.url tipo_actividad_url(tipo_actividad, format: :json)
end
