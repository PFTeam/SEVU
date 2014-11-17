json.array!(@informe_gastos) do |informe_gasto|
  json.extract! informe_gasto, :id, :montoTotal, :proyecto_id
  json.url informe_gasto_url(informe_gasto, format: :json)
end
