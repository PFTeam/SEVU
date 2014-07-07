json.array!(@actividades) do |actividad|
  json.extract! actividad, :id, :nombre, :descripcion, :duracion, :duracionReal, :fechaEstimadaInicio, :fechaRealInicio, :estrategiasIntervencion, :metodologiasIntervencion, :mecanismoEvaluacion, :resultadosEsperados, :objetivo_especifico_id, :proyecto_id, :tipo_actividad_id
  json.url actividad_url(actividad, format: :json)
end
