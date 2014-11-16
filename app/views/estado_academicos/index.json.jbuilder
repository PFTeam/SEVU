json.array!(@estado_academicos) do |estado_academico|
  json.extract! estado_academico, :id, :cantidad_materias_regulares, :cantidad_materias_aprobadas, :cantidad_materias_cursando, :usuario_id
  json.url estado_academico_url(estado_academico, format: :json)
end
