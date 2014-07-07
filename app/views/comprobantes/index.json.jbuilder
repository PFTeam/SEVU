json.array!(@comprobantes) do |comprobante|
  json.extract! comprobante, :id, :numero
  json.url comprobante_url(comprobante, format: :json)
end
