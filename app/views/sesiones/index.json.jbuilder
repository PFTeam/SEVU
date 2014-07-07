json.array!(@sesiones) do |sesion|
  json.extract! sesion, :id, :fechaInicio, :fechaFin, :usuario_id
  json.url sesion_url(sesion, format: :json)
end
