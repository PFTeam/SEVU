Warden::Manager.after_set_user(except: :fetch) do |record, warden, options|
  sesion = Sesion.create!(
    usuario_id: record.id,
    fechaInicio: Time.new, 
		fechaFin: nil
  )
	Transaccion.create!(
    descripcion: 'Inicio de sesión',
    sesion_id: sesion.id
  )
end

Warden::Manager.before_logout do |record, warden, options|
	sesion= Sesion.find_by(usuario_id: record.id, fechaFin: nil)
	Sesion.update(sesion.id, :fechaFin => Time.new)
	Transaccion.create!(
    descripcion: 'Fin de sesión',
    sesion_id: sesion.id
  )
end
