json.array!(@transaccions) do |transaccion|
  json.extract! transaccion, :id, :descripcion, :fechaTransaccion, :proyecto_id, :tipo_transaccion_id, :sesion_id
  json.url transaccion_url(transaccion, format: :json)
end
