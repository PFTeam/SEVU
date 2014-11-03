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
      rpdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trpdiego)
      rsdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trsdiego)
      padiego=Privilegio.create(nombre: "necesidad_publico", descripcion: "Permite la visualizacion de las necesidades para el publico general", tipo_privilegio: psdiego)
      pa1diego=Privilegio.create(nombre: "index_evento_publico", descripcion: "Permite ver los eventos públicos", tipo_privilegio: psdiego)
			pa2diego=Privilegio.create(nombre: "evento_publicos", descripcion: "Permite manejar los eventos públicos", tipo_privilegio: psdiego)
			pa3diego=Privilegio.create(nombre: "proyecto_publico", descripcion: "Permite ver los proyectos actuales", tipo_privilegio: psdiego)
			pa4diego=Privilegio.create(nombre: "notificaciones", descripcion: "Permite manejar notificaciones", tipo_privilegio: psdiego)
			pa5diego=Privilegio.create(nombre: "auditoria", descripcion: "Permite la auditoria de sistema", tipo_privilegio: psdiego)
      pa6diego=Privilegio.create(nombre: "configuraciones_generales", descripcion: "Permite la gestion general del sistema", tipo_privilegio: psdiego)

			pap1diego=Privilegio.create(nombre: "detalle_presupuestos", descripcion: "Permite manejar los detalles de presupuesto", tipo_privilegio: ppdiego)
			pap2diego=Privilegio.create(nombre: "asignacion_roles", descripcion: "Permite manejar las asignaciones de roles", tipo_privilegio: ppdiego)
			pap3diego=Privilegio.create(nombre: "show_organizacion_externas", descripcion: "Permite ver las organizaciones externas", tipo_privilegio: ppdiego)
			pap4diego=Privilegio.create(nombre: "estado_proyecto_historial", descripcion: "Permite ver y editar el historial de estado de proyecto", tipo_privilegio: ppdiego)
			pap5diego=Privilegio.create(nombre: "informe_gastos", descripcion: "Permite manejar los informes de gastos", tipo_privilegio: ppdiego)
			pap6diego=Privilegio.create(nombre: "detalle_gastos", descripcion: "Permite manejar los detalles de gastos", tipo_privilegio: ppdiego)
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
			pap18diego=Privilegio.create(nombre: "show_postulacion", descripcion: "Permite mostrar las postulaciones", tipo_privilegio: ppdiego)
			pap19diego=Privilegio.create(nombre: "edit_actividad", descripcion: "Permite editar la actividad y manejar detalles de gastos, comprobantes y reportes", tipo_privilegio: ppdiego)


      arddiego=AsignacionRolPredefinido.create(esActual: true, privilegio: padiego , rol: rsdiego)

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
    
    
    TipoRol.create(nombre: "Sistema", descripcion: "Roles aplicables a todo el sistema")
    trp= TipoRol.create(nombre: "Proyecto", descripcion: "Roles aplicables dentro de un proyecto")
    director = Rol.create(nombre: "Director", descripcion: "Responsable del proyecto", tipo_rol: trpdiego)
    voluntario = Rol.create(nombre: "Voluntario", descripcion: "Colaborador del proyecto", tipo_rol: trpdiego)


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
