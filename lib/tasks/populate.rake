namespace :db do
  desc "Limpar y poblar la base de datos"
  task :populate => :environment do
    require "populator" 
    require 'faker'
    password = "password"
    
    [Actividad, AsignacionActividad,AsignacionFuncion, AsignacionRolPredefinido, AsignacionRol,AsistenciaEvento,Colaborador,Comprobante, ConceptoGasto, DetalleGasto, DetallePresupuesto, EstadoActividad, EstadoPresupuesto, EstadoProyecto, EstadoUsuario, EventoPublico, Experiencia, Habilidad, HistorialEstadoActividad, HistorialEstadoPresupuesto, HistorialEstadoProyecto, HistorialEstadoUsuario, HorarioDisponible, InformeGasto, Necesidad, Nota, NotificacionEmail, NotificacionPredeterminada, Notificacion, NotificacionSistema, ObjetivoEspecifico, ObjetivoGeneral, OrganizacionExterna, Postulacion, Presupuesto, Privilegio, Proyecto, Reporte, Requisito, Restriccion, Rol, Sesion, TipoActividad, TipoHabilidad, TipoNotificacion, TipoPrivilegio, TipoProyecto, TipoRol, Transaccion, Usuario, Voluntario].each(&:delete_all)
   
      ppdiego=TipoPrivilegio.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
      psdiego=TipoPrivilegio.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")

      trpdiego=TipoRol.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
      trsdiego=TipoRol.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")

			director = Rol.create(nombre: "Director", descripcion: "Responsable del proyecto", tipo_rol: trpdiego)
			coordinador = Rol.create(nombre: "Coordinador", descripcion: "Responsable de llevar a cabo el proyecto", tipo_rol: trpdiego)
			coordinadorsistema = Rol.create(nombre: "Coordinador Sistema", descripcion: "Responsable de llevar a cabo la creación de proyectos", tipo_rol: trsdiego)
    	voluntario = Rol.create(nombre: "Voluntario", descripcion: "Colaborador del proyecto", tipo_rol: trpdiego)
      rsdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trsdiego)

      padiego=Privilegio.create(nombre: "necesidad_publico", descripcion: "Permite la visualizacion de las necesidades para el publico general", tipo_privilegio: psdiego)
      pa1diego=Privilegio.create(nombre: "index_evento_publico", descripcion: "Permite ver los eventos públicos", tipo_privilegio: psdiego)
			pa2diego=Privilegio.create(nombre: "evento_publicos", descripcion: "Permite manejar los eventos públicos", tipo_privilegio: psdiego)
			pa3diego=Privilegio.create(nombre: "proyecto_publico", descripcion: "Permite ver los proyectos actuales", tipo_privilegio: psdiego)
			
			pa5diego=Privilegio.create(nombre: "auditoria", descripcion: "Permite la auditoria de sistema", tipo_privilegio: psdiego)
      pa6diego=Privilegio.create(nombre: "configuraciones_generales", descripcion: "Permite la gestion general del sistema", tipo_privilegio: psdiego)
			pa7diego=Privilegio.create(nombre: "asignacion_rol_predefinido", descripcion: "Permite manejar las asignaciones de privilegios a roles", tipo_privilegio: psdiego)
			pa8diego=Privilegio.create(nombre: "regional", descripcion: "Permite manejar las regionales", tipo_privilegio: psdiego)
			pa9diego=Privilegio.create(nombre: "asistencia_evento", descripcion: "Permite manejar las asistencias a eventos", tipo_privilegio: psdiego)
			pa10diego=Privilegio.create(nombre: "nota", descripcion: "Permite manejar las notas dentro del proyecto", tipo_privilegio: psdiego)
			pa11diego=Privilegio.create(nombre: 'horarios_disponibles', descripcion: "Permite manejar los horarios disponibles del voluntario", tipo_privilegio: psdiego)
			pa12diego=Privilegio.create(nombre: "experiencia", descripcion: "Permite manejar las experiencias", tipo_privilegio: psdiego)
			pa13diego=Privilegio.create(nombre: "proyecto", descripcion: "Permite manejar proyectos", tipo_privilegio: psdiego)

			pap1diego=Privilegio.create(nombre: "detalle_presupuestos", descripcion: "Permite manejar los detalles de presupuesto", tipo_privilegio: ppdiego)
			pap2diego=Privilegio.create(nombre: "asignacion_roles", descripcion: "Permite manejar las asignaciones de roles", tipo_privilegio: ppdiego)
			pap3diego=Privilegio.create(nombre: "show_organizacion_externas", descripcion: "Permite ver las organizaciones externas", tipo_privilegio: ppdiego)
			pap4diego=Privilegio.create(nombre: "estado_proyecto_historial", descripcion: "Permite ver y editar el historial de estado de proyecto", tipo_privilegio: ppdiego)
			pap5diego=Privilegio.create(nombre: "informe_gastos", descripcion: "Permite manejar los informes de gastos", tipo_privilegio: ppdiego)
			pap6diego=Privilegio.create(nombre: "show_detalle_gastos", descripcion: "Permite ver los detalles de gastos", tipo_privilegio: ppdiego)
			pap7diego=Privilegio.create(nombre: "comprobantes", descripcion: "Permite manejar los comprobantes", tipo_privilegio: ppdiego)
			pap8diego=Privilegio.create(nombre: "concepto_gastos", descripcion: "Permite manejar los conceptos de gastos", tipo_privilegio: ppdiego)
			pap9diego=Privilegio.create(nombre: "proyecto_publico", descripcion: "Permite ver el proyecto, actividades, objetivos generales y específicos", tipo_privilegio: ppdiego)
			pap10diego=Privilegio.create(nombre: "edit_proyecto", descripcion: "Permite ver las organizaciones externas y editar el proyecto", tipo_privilegio: ppdiego)
			pap11diego=Privilegio.create(nombre: "tipo_proyectos", descripcion: "Permite manejar los tipos de proyectos", tipo_privilegio: ppdiego)
			pap12diego=Privilegio.create(nombre: "habilidades", descripcion: "Permite manejar las habilidades", tipo_privilegio: ppdiego)
			pap13diego=Privilegio.create(nombre: "tipo_habilidades", descripcion: "Permite manejar los tipos de habilidades", tipo_privilegio: ppdiego)
			pap14diego=Privilegio.create(nombre: "notificacion_predeterminadas", descripcion: "Permite manejar las notificaciones predeterminadas", tipo_privilegio: ppdiego)

			pap15diego=Privilegio.create(nombre: "new_presupuesto", descripcion: "Permite crear presupuestos", tipo_privilegio: ppdiego)
			pap16diego=Privilegio.create(nombre: "edit_presupuesto", descripcion: "Permite editar presupuestos", tipo_privilegio: ppdiego)
			pap17diego=Privilegio.create(nombre: "restricciones", descripcion: "Permite manejar las restricciones", tipo_privilegio: ppdiego)
			pap18diego=Privilegio.create(nombre: "show_new_postulacion", descripcion: "Permite mostrar y crear las postulaciones", tipo_privilegio: ppdiego)
			
			pap20diego=Privilegio.create(nombre: "edit_actividad", descripcion: "Permite editar la actividad y manejar detalles de gastos, comprobantes y reportes", tipo_privilegio: ppdiego)
			pap21diego=Privilegio.create(nombre: "manage_postulacion", descripcion: "Permite manejar las postulaciones", tipo_privilegio: ppdiego)
			pap22diego=Privilegio.create(nombre: "asignacion_actividad", descripcion: "Permite manejar las asignaciones de actividades", tipo_privilegio: ppdiego)
			pap23diego=Privilegio.create(nombre: "actividad", descripcion: "Permite manejar las actividades", tipo_privilegio: ppdiego)
			pap24diego=Privilegio.create(nombre: "objetivos", descripcion: "Permite manejar los objetivos del proyecto", tipo_privilegio: ppdiego)
			pap25diego=Privilegio.create(nombre: "organizacion_externas", descripcion: "Permite manejar las organizaciones externas", tipo_privilegio: ppdiego)
			pap26diego=Privilegio.create(nombre: "tipo_actividad", descripcion: "Permite manejar los tipos de actividades", tipo_privilegio: ppdiego)
			pap27diego=Privilegio.create(nombre: "proyecto", descripcion: "Permite manejar los tipos de actividades", tipo_privilegio: ppdiego)
			
			pap30diego=Privilegio.create(nombre: "reporte_generado", descripcion: "Permite generar reportes", tipo_privilegio: ppdiego)
			pap31diego=Privilegio.create(nombre: "colaborador", descripcion: "Permite manejar al colaborador", tipo_privilegio: ppdiego)
			
			pap33diego=Privilegio.create(nombre: "requisito", descripcion: "Permite manejar los requisitos", tipo_privilegio: ppdiego)
			pap34diego=Privilegio.create(nombre: "comprobante", descripcion: "Permite manejar los comprobantes", tipo_privilegio: ppdiego)
			pap35diego=Privilegio.create(nombre: "create_show_presupuestos", descripcion: "Permite crear y ver presupuestos", tipo_privilegio: ppdiego)
			pap36diego=Privilegio.create(nombre: "notificacion_email", descripcion: "Permite manejar las notificaciones de emails", tipo_privilegio: ppdiego)
			pap37diego=Privilegio.create(nombre: "notificaciones", descripcion: "Permite manejar notificaciones", tipo_privilegio: ppdiego)
			pap38diego=Privilegio.create(nombre: "notificacion_sistema", descripcion: "Permite manejar notificaciones", tipo_privilegio: ppdiego)
			pap39diego=Privilegio.create(nombre: "detalle_gasto", descripcion: "Permite manejar los detalles de los gastos", tipo_privilegio: ppdiego)
			pap40diego=Privilegio.create(nombre: "proyecto_director", descripcion: "Permite ver y editar un proyecto", tipo_privilegio: ppdiego)
			pap41diego=Privilegio.create(nombre: "reporte", descripcion: "Permite manejar reportes", tipo_privilegio: ppdiego)
			pap43diego=Privilegio.create(nombre: "transacciones", descripcion: "Permite realizar auditoria", tipo_privilegio: ppdiego)
			pap44diego=Privilegio.create(nombre: "presupuestos", descripcion: "Permite manejar presupuestos", tipo_privilegio: ppdiego)
			pap45diego=Privilegio.create(nombre: "index_show_actividad", descripcion: "Permite mostrar actividades", tipo_privilegio: ppdiego)
			pap46diego=Privilegio.create(nombre: "index_show_asignacion_actividades", descripcion: "Permite mostrar asignacion de actividades", tipo_privilegio: ppdiego)
			pap47diego=Privilegio.create(nombre: "index_show_asignacion_roles", descripcion: "Permite ver la asignacion de roles", tipo_privilegio: ppdiego)
			pap48diego=Privilegio.create(nombre: "index_show_objetivos", descripcion: "Permite ver los objetivos de un proyecto", tipo_privilegio: ppdiego)
			pap49diego=Privilegio.create(nombre: "show_index_informe_gasto", descripcion: "Permite ver los informes de gastos", tipo_privilegio: ppdiego)
			pap50diego=Privilegio.create(nombre: "notificacion_mailer", descripcion: "Permite manejar las notificaciones del mailer", tipo_privilegio: ppdiego)
			pap51diego=Privilegio.create(nombre: "show_index_historial_estado_proyecto", descripcion: "Permite mostrar los historiales de estado de proyecto", tipo_privilegio: ppdiego)
			pap52diego=Privilegio.create(nombre: "show_index_historial_estado_usuario", descripcion: "Permite mostrar los historiales de estado de usuario", tipo_privilegio: ppdiego)
			pap53diego=Privilegio.create(nombre: "show_index_historial_estado_actividad", descripcion: "Permite mostrar los historiales de estado de actividad", tipo_privilegio: ppdiego)

			pap54diego=Privilegio.create(nombre: "gestionar_estado_presupuesto", descripcion: "Permite gestionar el estado de un presupuesto", tipo_privilegio: ppdiego)



    #USUARIO 
      ard1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: padiego , rol: rsdiego)
			ard2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa1diego , rol: rsdiego)
			ard4diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa2diego , rol: rsdiego)
			ard5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa3diego , rol: rsdiego)
			ard6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa10diego , rol: rsdiego)
			ard7diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa11diego , rol: rsdiego)
			ard8diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa12diego , rol: rsdiego)
			ard9diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa9diego , rol: rsdiego)
		#DIRECTOR
			arc1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap23diego, rol: director)
			arc2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap36diego , rol: director)
			arc3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap22diego , rol: director)
			arc4diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap37diego , rol: director)
			arc5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap2diego , rol: director)
			arc6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap14diego , rol: director)
			arc7diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap38diego , rol: director)
			arc8diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap24diego , rol: director)
			arc9diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap31diego , rol: director)
			arc10diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap34diego , rol: director)
			arc11diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap25diego , rol: director)
			arc12diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap8diego , rol: director)
			arc13diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap21diego  , rol: director)
			arc14diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap39diego , rol: director)
			arc15diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap35diego   , rol: director)
			arc16diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap1diego  , rol: director)
			arc17diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap40diego  , rol: director)
			arc18diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap41diego  , rol: director)
			arc19diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap33diego   , rol: director)
			arc20diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap12diego  , rol: director)
			arc21diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap5diego  , rol: director)
			arc22diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap13diego  , rol: director)
			arc23diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap51diego  , rol: director)
			arc24diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap52diego  , rol: director)
			arc25diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap53diego  , rol: director)

		#COORDINADOR
			arcc1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap23diego, rol: coordinador)
			arcc2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap36diego , rol: coordinador)
			arcc3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap22diego , rol: coordinador)
			arcc4diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap37diego , rol: coordinador)
			arcc5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap2diego , rol: coordinador)
			arcc6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap14diego , rol: coordinador)
			arcc7diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap38diego , rol: coordinador)
			arcc8diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap24diego , rol: coordinador)
			arcc9diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap31diego , rol: coordinador)
			arcc10diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap34diego , rol: coordinador)
			arcc11diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap25diego , rol: coordinador)
			arcc12diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap8diego , rol: coordinador)
			arcc13diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap21diego  , rol: coordinador)
			arcc14diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap39diego , rol: coordinador)
			arcc15diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap35diego   , rol: coordinador)
			arcc16diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap1diego  , rol: coordinador)
			arcc17diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap40diego  , rol: coordinador)
			arcc18diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap41diego  , rol: coordinador)
			arcc19diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap33diego   , rol: coordinador)
			arcc20diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap12diego  , rol: coordinador)
			arcc21diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap5diego  , rol: coordinador)

			arcc22diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa13diego, rol: coordinadorsistema)
			arcc23diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap30diego  , rol: coordinador)
			arcc24diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap43diego , rol: coordinador)
			arcc25diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap44diego , rol: coordinador)
			arcc26diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap17diego , rol: coordinador)


		#VOLUNTARIO

		arv1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap45diego  , rol: voluntario)
		arv2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap46diego , rol: voluntario)
		arv3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap47diego , rol: voluntario)
		arv4diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap48diego  , rol: voluntario)
		arv5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap7diego  , rol: voluntario)
		arv6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap21diego  , rol: voluntario)
		arv7diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap39diego  , rol: voluntario)
		arv8diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap49diego  , rol: voluntario)
		arv9diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap36diego  , rol: voluntario)
		arv10diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap37diego  , rol: voluntario)
		arv11diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap50diego , rol: voluntario)
		arv12diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap38diego  , rol: voluntario)
		arv13diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap52diego  , rol: voluntario)
		arv14diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap53diego  , rol: voluntario)


			EstadoUsuario.create(nombre: "Activo", descripcion: "El usuario se encuentra activo dentro del sistema")
			EstadoUsuario.create(nombre: "Suspendido", descripcion: "El usuario se encuentra suspendido dentro del sistema")


    u= Usuario.create!(nombreUsuario: "joel",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Sierra, Adrian",
								       email: "one.last.heaven@gmail.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                                                  foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

#    admin = Usuario.create!(nombreUsuario: "admin",
#								       password: password, 
#								       password_confirmation: password,  
#								       apellido_nombre: "Sierra, Adrian",
#								       email: "noguera.sistemas@gmail.com",
#								       direccion: Faker::Address.street_address,
#								       telefono: Faker::PhoneNumber.cell_phone,
#								       fax: Faker::PhoneNumber.phone_number,
 #                                                 foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))
    u_otro = Usuario.create!(nombreUsuario: "adrian",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Sierra, Adrian",
								       email: "adrian@email.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                                                  foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))



    u1 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u2 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u3 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u4 =	Usuario.create!(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u5 = 	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password,  apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u6 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password,  apellido_nombre: Faker::Name.name, email:Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u7 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u8 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u9 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

u10 =	Usuario.create(nombreUsuario: Faker::Internet.user_name, password: password, password_confirmation: password, apellido_nombre: Faker::Name.name, email: Faker::Internet.email, direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))

v = Voluntario.create!(nombreUsuario: "agustin",
       password: password, 
       password_confirmation: password,  
       apellido_nombre: "Serrano, Agustin",
       email: "voluntario@email.com",
       direccion: Faker::Address.street_address,
       telefono: Faker::PhoneNumber.cell_phone,
       fax: Faker::PhoneNumber.phone_number,
	 legajo: 34587,
       type: 'Voluntario',
      foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample))


    creado = EstadoProyecto.create(nombre: "Creado", descripcion: "El proyecto se encuentra en estado creado")
    EstadoProyecto.create(nombre: "En Ejecución", descripcion: "El proyecto se encuentra en ejecución")
    EstadoProyecto.create(nombre: "Suspendido", descripcion: "El proyecto se encuentra momentaneamente suspendido")
    EstadoProyecto.create(nombre: "Cancelado", descripcion: "El proyecto se encuentra definitivamente cancelado")
    EstadoProyecto.create(nombre: "Terminado", descripcion: "El proyecto ha terminado")


    EstadoActividad.create(nombre: "Creada", descripcion: "La actividad se encuentra creada")
    EstadoActividad.create(nombre: "Planificada", descripcion: "La actividad se encuentra planificada")
    EstadoActividad.create(nombre: "Ejecutada", descripcion: "La actividad se encuentra actualmente en ejecución")
    EstadoActividad.create(nombre: "Terminada", descripcion: "La actividad ha terminado")
    EstadoActividad.create(nombre: "Cancelada", descripcion: "La actividad ha sido cancelada")
    EstadoActividad.create(nombre: "Creada", descripcion: "")
    

    


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

      
      presupuesto = Presupuesto.create(fechaPresentacion: 1.year.from_now, montoTotal: 23, aprobado: false, proyecto: p, usuario: u)

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




  end

end
