json.array!(@concepto_gastos) do |concepto_gasto|
  json.extract! concepto_gasto, :id, :titulo, :descripcion
  json.url concepto_gasto_url(concepto_gasto, format: :json)
end
