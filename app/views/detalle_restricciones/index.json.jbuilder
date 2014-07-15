json.array!(@detalle_restricciones) do |detalle_restriccion|
  json.extract! detalle_restriccion, :id, :esActiva, :fechaDesde, :fechaHasta, :montoMax, :restriccion_id, :concepto_gasto_id
  json.url detalle_restriccion_url(detalle_restriccion, format: :json)
end
