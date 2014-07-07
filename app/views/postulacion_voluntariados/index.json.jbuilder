json.array!(@postulacion_voluntariados) do |postulacion_voluntariado|
  json.extract! postulacion_voluntariado, :id, :fechaPostulacion, :aceptado, :proyecto_id, :usuario_id
  json.url postulacion_voluntariado_url(postulacion_voluntariado, format: :json)
end
