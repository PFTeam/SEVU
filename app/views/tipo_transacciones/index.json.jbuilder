json.array!(@tipo_transacciones) do |tipo_transaccion|
  json.extract! tipo_transaccion, :id, :descripcion
  json.url tipo_transaccion_url(tipo_transaccion, format: :json)
end
