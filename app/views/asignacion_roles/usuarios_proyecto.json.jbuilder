json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombreUsuario, :apellido_nombre, :email
  json.informal [usuario.nombreUsuario, usuario.email].reject(&:blank?).join ' | '
  json.url usuario_url(usuario, format: :json)
end
