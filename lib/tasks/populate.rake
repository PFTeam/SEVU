namespace :db do
  desc "Limpar y poblar la base de datos"
  task :populate => :environment do
    require "populator" 
    require 'faker'
    password = "password"
    
    [Actividad, AsignacionActividad,AsignacionFuncion, AsignacionRolPredefinido, AsignacionRol,AsistenciaEvento,Colaborador,Comprobante, ConceptoGasto, DetalleGasto, DetallePresupuesto, DetalleRestriccion, EstadoActividad, EstadoPresupuesto, EstadoProyecto, EstadoUsuario, EventoPublico, Experiencia, Habilidad, HistorialEstadoActividad, HistorialEstadoPresupuesto, HistorialEstadoProyecto, HistorialEstadoUsuario, HorarioDisponible, InformeGasto, Necesidad, Nota, NotificacionEmail, NotificacionPredeterminada, Notificacion, NotificacionSistema, ObjetivoEspecifico, ObjetivoGeneral, OrganizacionExterna, Postulacion, Presupuesto, Privilegio, Proyecto, Reporte, Requisito, Restriccion, Rol, Sesion, TipoActividad, TipoHabilidad, TipoNotificacion, TipoPrivilegio, TipoProyecto, TipoRol, TipoTransaccion, Transaccion, Usuario, Voluntario].each(&:delete_all)
   
      
    u = Usuario.create!(nombreUsuario: "SEVU",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Sevu, Team",
								       email: "noguera.sistemas@gmail.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number)


    u1 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u2 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u3 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u4 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u5 = 	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password,  apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u6 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password,  apellido_nombre: Faker::Name.name, email:Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u7 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u8 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u9 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

u10 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number)

v = Voluntario.create!(nombreUsuario: "Voluntario",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Voluntario, Sevu",
								       email: "voluntario@github.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
		      						       legajo: 34587,
								       type: 'Voluntario'
		      						       )




    creado = EstadoProyecto.create(nombre: "Creado", descripcion: "El proyecto se encuentra en estado creado")
    EstadoProyecto.create(nombre: "En Ejecución", descripcion: "El proyecto se encuentra en ejecución")
    EstadoProyecto.create(nombre: "Suspendido", descripcion: "El proyecto se encuentra momentaneamente suspendido")
    EstadoProyecto.create(nombre: "Cancelado", descripcion: "El proyecto se encuentra definitivamente cancelado")
    EstadoProyecto.create(nombre: "Terminado", descripcion: "El proyecto ha terminado")


    EstadoActividad.create(nombre: "Creada", descripcion: "La actividad se encuentra creada")
    EstadoActividad.create(nombre: "Planificada", descripcion: "La actividad se encuentra planificada")
    EstadoActividad.create(nombre: "Ejecutada", descripcion: "La actividad se encuentra actualmente en ejecución")
    EstadoActividad.create(nombre: "Terminada", descripcion: "La actividad ha terminado")
    EstadoActividad.create(nombre: "Creada", descripcion: "")
    
    
    TipoRol.create(nombre: "Sistema", descripcion: "Roles aplicables a todo el sistema")
    trp= TipoRol.create(nombre: "Proyecto", descripcion: "Roles aplicables dentro de un proyecto")
    director = Rol.create(nombre: "Director", descripcion: "Responsable del proyecto", tipo_rol: trp)
    voluntario = Rol.create(nombre: "Voluntario", descripcion: "Colaborador del proyecto", tipo_rol: trp)

    tipo_proyecto = TipoProyecto.create(nombre: "voluntariado", descripcion: "Proyecto sin remuneración económica")

    n= Necesidad.create(descripcion: "Queremos comenzar con la investigación en el manejo de autos juntos con la UNC",
			usuario: u,
		    titulo: "Sistema de manejo de auto confiable")
    p = Proyecto.create(nombre: "Creación de un sistema confiable Autos", breveDescripcion: "Se desarrollará un sistema para poder administrador un auto sin errores y poder dirigirlo de manera autónoma",
		    fechaInicio: 1.month.ago,
		    fechaFin: 1.year.from_now,
		    antecedentes: "Ninguno",
		    justificacionProyecto: "Se desea avanzar ene l campo de la automaticación en cuanto al tema vehicular",
		    cantidadBeneficiariosDirectos: 100, cantidadBeneficiariosIndirectos: 200,
		    justificacionImpacto: "Se está realizando en conjunto con un grpo de la UNC el cual permitirá la divulgación del proyecto y por ende su impacto",
		    localizacionGeografica: "Mendoza",
		    tipo_proyecto: tipo_proyecto ,
		    necesidad: n)
		     

      AsignacionRol.create(proyecto: p , usuario: u, rol: director , esActual: true).save
      AsignacionRol.create(proyecto: p , usuario: u, rol: voluntario, esActual: true).save

      HistorialEstadoProyecto.create(proyecto: p, estado_proyecto: creado)

      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1651654-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)

      concepto1 = ConceptoGasto.create(titulo: "Viáticos", descripcion: "Gastos realizando en viáticos")
      concepto2 = ConceptoGasto.create(titulo: "Librería", descripcion: "Gastos realizando en librería")
      concepto3 = ConceptoGasto.create(titulo: "Transporte", descripcion: "Gastos realizando en transporte")

      restriccion = Restriccion.create(fechaDesde: 1.month.ago, fechaHasta: 1.month.from_now, esActiva: true, tipo_proyecto: tipo_proyecto )

      presupuesto = Presupuesto.create(fechaPresentacion: 1.year.from_now, montoTotal: 23, aprobado: false, proyecto: p, restriccion: restriccion, usuario: u)

      DetallePresupuesto.create(titulo: "Almuerzo", descripcion: "Se gastará en un almuerzo", monto: 15, presupuesto: presupuesto, concepto_gasto: concepto1)
      DetallePresupuesto.create(titulo: "Cuadernos", descripcion: "Se gastará en un cuaderno para escribir", monto: 8, presupuesto: presupuesto, concepto_gasto: concepto2)

      informe_gasto = InformeGasto.create(montoTotal: 23, proyecto: p)

      DetalleGasto.create(titulo: "Almuerzo", descripcion: "Se gastó en un almuerzo", monto: 10, informe_gasto_id: informe_gasto.id, concepto_gasto: concepto1)
      DetalleGasto.create(titulo: "Cuadernos", descripcion: "Se gastó en un cuaderno para escribir", monto: 5, informe_gasto_id: informe_gasto.id, concepto_gasto: concepto2)
      TipoHabilidad.create(nombre: "Programación", descripcion: "Conocimiento referidos a la programación")
      TipoHabilidad.create(nombre: "Manualidades", descripcion: "Conocimiento vinculado con actividades creativas")
      Habilidad.create(nombre: "Pintar", descripcion: "Saber pintar con cualquier elemento", tipo_habilidad: TipoHabilidad.find_by(nombre: "Manualidades"))
      Habilidad.create(nombre: "Programación en Java", descripcion: "Programación en el lenguaje Java", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))

      TipoActividad.create(nombre: "Reunión", descripcion: "Actividades destinadas a las reuniones de cualquier índole")
      TipoActividad.create(nombre: "Voluntariado", descripcion: "Actividades destinadas a realizar trabajo de voluntariado")


			ppdiego=TipoPrivilegio.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
			psdiego=TipoPrivilegio.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")
			trpdiego=TipoRol.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
			trsdiego=TipoRol.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")
			rpdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trpdiego)
			rsdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trsdiego)
			padiego=Privilegio.create(nombre: "index_necesidad", descripcion: "Permite la visualizacion de las transacciones", tipo_privilegio: psdiego)
			pa1diego=Privilegio.create(nombre: "auditoria", descripcion: "Permite la auditoria de sistema", tipo_privilegio: psdiego)
			pad2iego=Privilegio.create(nombre: "roles", descripcion: "Permite la visualizacion de los roles", tipo_privilegio: psdiego)
			arddiego=AsignacionRolPredefinido.create(esActual: true, privilegio: padiego , rol: rsdiego)

  end

end
