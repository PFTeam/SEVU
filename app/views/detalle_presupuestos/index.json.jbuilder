json.array!(@detalle_presupuestos) do |detalle_presupuesto|
  json.extract! detalle_presupuesto, :id, :titulo, :descripcion, :monto, :presupuesto_id, :concepto_gasto_id
  json.url detalle_presupuesto_url(detalle_presupuesto, format: :json)
end
