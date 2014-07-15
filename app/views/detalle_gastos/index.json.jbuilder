json.array!(@detalle_gastos) do |detalle_gasto|
  json.extract! detalle_gasto, :id, :titulo, :descripcion, :monto, :concepto_gasto_id, :informe_gastos_id, :voluntario_id, :comprobante_id
  json.url detalle_gasto_url(detalle_gasto, format: :json)
end
