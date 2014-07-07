json.array!(@comprobantes) do |comprobant|
  json.extract! comprobant, :id, :numero
  json.url comprobant_url(comprobant, format: :json)
end
