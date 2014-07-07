json.array!(@presupuestos) do |presupuesto|
  json.extract! presupuesto, :id, :fechaPresentacion, :montoTotal, :aprobado, :proyecto_id, :restriccion_id, :usuario_id
  json.url presupuesto_url(presupuesto, format: :json)
end
