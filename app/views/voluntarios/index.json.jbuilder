json.array!(@voluntarios) do |voluntario|
  json.extract! voluntario, :id, :legajo
  json.url voluntario_url(voluntario, format: :json)
end
