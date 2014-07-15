json.array!(@estado_presupuestos) do |estado_presupuesto|
  json.extract! estado_presupuesto, :id, :nombre
  json.url estado_presupuesto_url(estado_presupuesto, format: :json)
end
