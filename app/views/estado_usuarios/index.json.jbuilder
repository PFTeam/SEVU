json.array!(@estado_usuarios) do |estado_usuario|
  json.extract! estado_usuario, :id, :nombre
  json.url estado_usuario_url(estado_usuario, format: :json)
end
