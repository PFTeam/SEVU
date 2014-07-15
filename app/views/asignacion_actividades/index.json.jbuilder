json.array!(@asignacion_actividades) do |asignacion_actividad|
  json.extract! asignacion_actividad, :id, :vigente, :fechaAsignacion, :actividad_id, :usuario_id
  json.url asignacion_actividad_url(asignacion_actividad, format: :json)
end
