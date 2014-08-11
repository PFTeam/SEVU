json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombreUsuario, :contrasenia, :apellidoNombre, :email, :direccion, :fechaRegistro, :foto
  json.url usuario_url(usuario, format: :json)
end
