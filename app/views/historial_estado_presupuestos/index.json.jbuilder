json.array!(@historial_estado_presupuestos) do |historial_estado_presupuesto|
  json.extract! historial_estado_presupuesto, :id, :esActual, :fechaCambioEstado, :presupuesto_id, :estado_presupuesto_id
  json.url historial_estado_presupuesto_url(historial_estado_presupuesto, format: :json)
end
