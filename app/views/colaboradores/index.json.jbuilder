json.array!(@colaboradores) do |colaborador|
  json.extract! colaborador, :id, :organizacion_externa_id, :proyecto_id
  json.url colaborador_url(colaborador, format: :json)
end
