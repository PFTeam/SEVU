json.array!(@postulaciones) do |postulacion|
  json.extract! postulacion, :id, :fechaPostulacion, :aceptado, :proyecto_id, :usuario_id
  json.url postulacion_url(postulacion, format: :json)
end
