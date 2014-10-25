Warden::Manager.after_set_user(except: :fetch) do |record, warden, options|
if Usuario.find(record.id).confirmed?  
	sesion = Sesion.create!(
    usuario_id: record.id,
    fechaInicio: Time.new, 
		fechaFin: nil
  )
	Transaccion.create!(
    descripcion: 'Inicio de sesión del usuario '+record.nombreUsuario,
    sesion_id: sesion.id
  )
end
end

Warden::Manager.before_logout do |record, warden, options|
	sesion= Sesion.find_by(usuario_id: record.id, fechaFin: nil)
	if sesion != nil then
	Sesion.update(sesion.id, :fechaFin => Time.new)
	Transaccion.create!(
    descripcion: 'Fin de sesión',
    sesion_id: sesion.id
  )
end
end
