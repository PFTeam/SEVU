namespace :db do
  desc "Limpar y poblar la base de datos"
  task :populate => :environment do
    require "populator" 
    require 'faker'
    password = "password"
    
    [Actividad, AsignacionActividad,AsignacionFuncion, AsignacionRolPredefinido, AsignacionRol,AsistenciaEvento,Colaborador,Comprobante, ConceptoGasto, DetalleGasto, DetallePresupuesto, EstadoActividad, EstadoPresupuesto, EstadoProyecto, EstadoUsuario, EventoPublico, Experiencia, Habilidad, HistorialEstadoActividad, HistorialEstadoPresupuesto, HistorialEstadoProyecto, HistorialEstadoUsuario, HorarioDisponible, InformeGasto, Necesidad, Nota, NotificacionEmail, NotificacionPredeterminada, Notificacion, NotificacionSistema, ObjetivoEspecifico, ObjetivoGeneral, OrganizacionExterna, Postulacion, Presupuesto, Privilegio, Proyecto, Reporte, Requisito, Restriccion, Rol, Sesion, TipoActividad, TipoHabilidad, TipoNotificacion, TipoPrivilegio, TipoProyecto, TipoRol, Transaccion, Usuario, Voluntario].each(&:delete_all)
   

			#TIPO PRIVILEGIOS
      ppdiego=TipoPrivilegio.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
      psdiego=TipoPrivilegio.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")

			#TIPO ROL
      trpdiego=TipoRol.create(nombre: "Proyecto", descripcion: "Privilegio para la utilización de un modulo o funcionalidad del sistema")
      trsdiego=TipoRol.create(nombre: "Sistema", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto")

			#ROL
			director = Rol.create(nombre: "Director", descripcion: "Responsable del proyecto", tipo_rol: trpdiego)
			coordinador = Rol.create(nombre: "Coordinador", descripcion: "Responsable de llevar a cabo el proyecto", tipo_rol: trpdiego)
			coordinadorsistema = Rol.create(nombre: "Coordinador Sistema", descripcion: "Responsable de llevar a cabo la creación de proyectos", tipo_rol: trsdiego)
    	voluntario = Rol.create(nombre: "Voluntario", descripcion: "Colaborador del proyecto", tipo_rol: trpdiego)
      rsdiego=Rol.create(nombre: "Default", descripcion: "Privilegio para la utilización de un modulo o funcionalidad dentro de un proyecto", tipo_rol: trsdiego)

			#PRIVILEGIO
      padiego=Privilegio.create(nombre: "necesidad_publico", descripcion: "Permite la visualizacion de las necesidades para el publico general", tipo_privilegio: psdiego)
      pa1diego=Privilegio.create(nombre: "index_evento_publico", descripcion: "Permite ver los eventos públicos", tipo_privilegio: psdiego)
			pa2diego=Privilegio.create(nombre: "evento_publicos", descripcion: "Permite manejar los eventos públicos", tipo_privilegio: psdiego)
			pa3diego=Privilegio.create(nombre: "proyecto_publico", descripcion: "Permite ver los proyectos actuales", tipo_privilegio: psdiego)		
      pa6diego=Privilegio.create(nombre: "configuraciones_generales", descripcion: "Permite la gestion general del sistema", tipo_privilegio: psdiego)
			pa7diego=Privilegio.create(nombre: "asignacion_rol_predefinido", descripcion: "Permite manejar las asignaciones de privilegios a roles", tipo_privilegio: psdiego)
			pa8diego=Privilegio.create(nombre: "regional", descripcion: "Permite manejar las regionales", tipo_privilegio: psdiego)
			pa9diego=Privilegio.create(nombre: "asistencia_evento", descripcion: "Permite manejar las asistencias a eventos", tipo_privilegio: psdiego)
			pa10diego=Privilegio.create(nombre: "nota", descripcion: "Permite manejar las notas dentro del proyecto", tipo_privilegio: psdiego)
			pa11diego=Privilegio.create(nombre: 'horarios_disponibles', descripcion: "Permite manejar los horarios disponibles del voluntario", tipo_privilegio: psdiego)
			pa12diego=Privilegio.create(nombre: "experiencia", descripcion: "Permite manejar las experiencias", tipo_privilegio: psdiego)
			pa13diego=Privilegio.create(nombre: "proyecto", descripcion: "Permite manejar proyectos", tipo_privilegio: psdiego)
			pa14diego=Privilegio.create(nombre: "asignacion_rol", descripcion: "Permite manejar las asignaciones de roles", tipo_privilegio: psdiego)				
			pa15diego=Privilegio.create(nombre: "edit_update_usuario", descripcion: "Permite editar el usuario", tipo_privilegio: psdiego)
			pa16diego=Privilegio.create(nombre: "notificacion_sistema", descripcion: "Permite manejar notificaciones", tipo_privilegio: psdiego)
			pa17diego=Privilegio.create(nombre: "notificacion_email", descripcion: "Permite manejar las notificaciones de emails", tipo_privilegio: psdiego)
			pa18diego=Privilegio.create(nombre: "notificaciones", descripcion: "Permite manejar notificaciones", tipo_privilegio: psdiego)
			pa20diego=Privilegio.create(nombre: "notificacion_mailer", descripcion: "Permite manejar las notificaciones del mailer", tipo_privilegio: psdiego)
			pap18diego=Privilegio.create(nombre: "new_postulacion", descripcion: "Permite mostrar y crear las postulaciones", tipo_privilegio: psdiego)	
			pa58diego=Privilegio.create(nombre: "index_usuario", descripcion: "Permite ver los usuarios del sistema", tipo_privilegio: psdiego)
			pap60diego=Privilegio.create(nombre: "gestion_notificacion", descripcion: "Permite la gestión de las notificaciones", tipo_privilegio: psdiego)

			pap57diego=Privilegio.create(nombre: "notificacion_predeterminadas", descripcion: "Permite manejar las notificaciones predeterminadas", tipo_privilegio: ppdiego)
			pap1diego=Privilegio.create(nombre: "detalle_presupuestos", descripcion: "Permite manejar los detalles de presupuesto", tipo_privilegio: ppdiego)
			pap2diego=Privilegio.create(nombre: "asignacion_roles", descripcion: "Permite manejar las asignaciones de roles", tipo_privilegio: ppdiego)
			pap3diego=Privilegio.create(nombre: "show_organizacion_externas", descripcion: "Permite ver las organizaciones externas", tipo_privilegio: ppdiego)
			pap4diego=Privilegio.create(nombre: "estado_proyecto_historial", descripcion: "Permite ver y editar el historial de estado de proyecto", tipo_privilegio: ppdiego)
			pap5diego=Privilegio.create(nombre: "informe_gastos", descripcion: "Permite manejar los informes de gastos", tipo_privilegio: ppdiego)
			pap6diego=Privilegio.create(nombre: "show_detalle_gastos", descripcion: "Permite ver los detalles de gastos", tipo_privilegio: ppdiego)
			pap7diego=Privilegio.create(nombre: "comprobantes", descripcion: "Permite manejar los comprobantes", tipo_privilegio: ppdiego)
			pap8diego=Privilegio.create(nombre: "concepto_gastos", descripcion: "Permite manejar los conceptos de gastos", tipo_privilegio: ppdiego)
			pap9diego=Privilegio.create(nombre: "proyecto_voluntario", descripcion: "Permite ver el proyecto, actividades, objetivos generales y específicos", tipo_privilegio: ppdiego)
			pap10diego=Privilegio.create(nombre: "edit_proyecto", descripcion: "Permite ver las organizaciones externas y editar el proyecto", tipo_privilegio: ppdiego)
			pap11diego=Privilegio.create(nombre: "tipo_proyectos", descripcion: "Permite manejar los tipos de proyectos", tipo_privilegio: ppdiego)
			pap12diego=Privilegio.create(nombre: "habilidades", descripcion: "Permite manejar las habilidades", tipo_privilegio: ppdiego)
			pap13diego=Privilegio.create(nombre: "tipo_habilidades", descripcion: "Permite manejar los tipos de habilidades", tipo_privilegio: ppdiego)
			pap15diego=Privilegio.create(nombre: "new_presupuesto", descripcion: "Permite crear presupuestos", tipo_privilegio: ppdiego)
			pap16diego=Privilegio.create(nombre: "edit_presupuesto", descripcion: "Permite editar presupuestos", tipo_privilegio: ppdiego)
			pap17diego=Privilegio.create(nombre: "restricciones", descripcion: "Permite manejar las restricciones", tipo_privilegio: ppdiego)		
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
			pap51diego=Privilegio.create(nombre: "show_index_historial_estado_proyecto", descripcion: "Permite mostrar los historiales de estado de proyecto", tipo_privilegio: ppdiego)
			pap52diego=Privilegio.create(nombre: "show_index_historial_estado_usuario", descripcion: "Permite mostrar los historiales de estado de usuario", tipo_privilegio: ppdiego)
			pap53diego=Privilegio.create(nombre: "show_index_historial_estado_actividad", descripcion: "Permite mostrar los historiales de estado de actividad", tipo_privilegio: ppdiego)
			pap54diego=Privilegio.create(nombre: "gestionar_estado_presupuesto", descripcion: "Permite gestionar el estado de un presupuesto", tipo_privilegio: ppdiego)
			pap55diego=Privilegio.create(nombre: "voluntarios", descripcion: "Permite gestionar los voluntarios", tipo_privilegio: ppdiego)
			pap56diego=Privilegio.create(nombre: "gestionar_presupuesto", descripcion: "Permite gestionar el presupuesto", tipo_privilegio: ppdiego)
			pap59diego=Privilegio.create(nombre: "estado_academico", descripcion: "Permite ver los estados academicos de los voluntarios", tipo_privilegio: ppdiego)


    #USUARIO 
      ard1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: padiego , rol: rsdiego)
			ard2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa1diego , rol: rsdiego)
			ard5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa3diego , rol: rsdiego)
			ard6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa10diego , rol: rsdiego)
			ard7diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa11diego , rol: rsdiego)
			ard8diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa12diego , rol: rsdiego)
			ard9diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa9diego , rol: rsdiego)
			ard10diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa15diego , rol: rsdiego)
			ard11diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa16diego , rol: rsdiego)
			rd13diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa17diego , rol: rsdiego)
			rd14diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa18diego , rol: rsdiego)
			rd15diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa20diego , rol: rsdiego)
			rd16diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap18diego , rol: rsdiego)
			rd17diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap60diego , rol: rsdiego)



		#DIRECTOR
			arc1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap23diego, rol: director)
			arc3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap22diego , rol: director)
			arc5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap2diego , rol: director)
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
			arc26diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap55diego  , rol: director)
			arc27diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap56diego  , rol: director)
			arc28diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap1diego, rol: director)
			arc30diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap57diego, rol: director)
			arc31diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap59diego, rol: director)
	

		#COORDINADOR
			arcc1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap23diego, rol: coordinador)
			arc31diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap51diego  , rol: coordinador)
			arcc3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap22diego , rol: coordinador)
			arcc5diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap2diego , rol: coordinador)
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
			arcc22diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa13diego, rol: coordinador)
			arcc27diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa14diego , rol: coordinador)
			arcc23diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap30diego  , rol: coordinador)
			arcc24diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap43diego , rol: coordinador)
			arcc25diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap44diego , rol: coordinador)
			arcc26diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap17diego , rol: coordinador)
			arcc27diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa58diego, rol: coordinador)
			arcc28diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap55diego , rol: coordinador)
			arcc29diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap13diego  , rol: coordinador)
			arcc30diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap57diego, rol: coordinador)
			arcc31diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap59diego, rol: coordinador)


		#COORDINADORSISTEMA
			arcc29diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pa2diego , rol: coordinadorsistema)

		#VOLUNTARIO

		arv1diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap45diego  , rol: voluntario)
		arv2diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap46diego , rol: voluntario)
		arv3diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap47diego , rol: voluntario)
		arv4diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap48diego  , rol: voluntario)
		arv6diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap21diego  , rol: voluntario)
		arv13diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap52diego  , rol: voluntario)
		arv14diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap53diego  , rol: voluntario)
		arv16diego=AsignacionRolPredefinido.create(esActual: true, privilegio: pap9diego  , rol: voluntario)



		#ESTADOS_USUARIO
			eu1=EstadoUsuario.create(nombre: "Activo", descripcion: "El usuario se encuentra activo dentro del sistema")
			eu2=EstadoUsuario.create(nombre: "Suspendido", descripcion: "El usuario se encuentra suspendido dentro del sistema")

		#ESTADO PROYECTO
    creado = EstadoProyecto.create(nombre: "Creado", descripcion: "El proyecto se encuentra en estado creado")
    enejec= EstadoProyecto.create(nombre: "En Ejecución", descripcion: "El proyecto se encuentra en ejecución")
    EstadoProyecto.create(nombre: "Suspendido", descripcion: "El proyecto se encuentra momentaneamente suspendido")
    EstadoProyecto.create(nombre: "Cancelado", descripcion: "El proyecto se encuentra definitivamente cancelado")
    EstadoProyecto.create(nombre: "Terminado", descripcion: "El proyecto ha terminado")

		#ESTADO ACTIVIDAD
    eaa1=EstadoActividad.create(nombre: "Creada", descripcion: "La actividad se encuentra creada")
    eaa2=EstadoActividad.create(nombre: "Planificada", descripcion: "La actividad se encuentra planificada")
    eaa3=EstadoActividad.create(nombre: "Ejecutada", descripcion: "La actividad se encuentra actualmente en ejecución")
    eaa4=EstadoActividad.create(nombre: "Terminada", descripcion: "La actividad ha terminado")
    eaa5=EstadoActividad.create(nombre: "Cancelada", descripcion: "La actividad ha sido cancelada")

    

    #TIPO ACTIVIDAD
      TipoActividad.create(nombre: "Reunión", descripcion: "Actividades destinadas a las reuniones de cualquier índole")
      TipoActividad.create(nombre: "Voluntariado", descripcion: "Actividades destinadas a realizar trabajo de voluntariado")
      TipoActividad.create(nombre: "Propaganda", descripcion: "Actividades destinadas a realizar trabajo de Propaganda")
      TipoActividad.create(nombre: "Control", descripcion: "Actividades destinadas a realizar trabajo de Control de Gestion")
      TipoActividad.create(nombre: "Trabajo de Campo", descripcion: "Actividades destinadas a realizar trabajo de Campo fuera de la Facultad")
      TipoActividad.create(nombre: "Busqueda de Financimiento", descripcion: "Actividades destinadas a realizar busqueda de posible financiamiento")
      TipoActividad.create(nombre: "Busqueda de Voluntarios", descripcion: "Actividades destinadas a realizar buesqueda de nuevos voluntarios")

		#TIPO PROYECTO
    tipo_proyecto = TipoProyecto.create(nombre: "Voluntariado", descripcion: "Proyecto sin remuneración económica")
    TipoProyecto.create(nombre: "Extensión", descripcion: "Proyecto con remuneración económica")

		
		#TIPO NOTIFICACION
	  TipoNotificacion.create(nombre: "Email")
	  TipoNotificacion.create(nombre: "Sistema")

		#TIPO HABILIDAD
      TipoHabilidad.create(nombre: "Programación", descripcion: "Conocimiento referidos a la programación")
      TipoHabilidad.create(nombre: "Manualidades", descripcion: "Conocimiento vinculado con actividades creativas")
      TipoHabilidad.create(nombre: "Administracion", descripcion: "Conocimiento vinculado con actividades creativas")
      TipoHabilidad.create(nombre: "Oratoria", descripcion: "Conocimiento vinculado con actividades creativas")

		#CONCEPTOS GASTOS
			concepto1 = ConceptoGasto.create(titulo: "Viáticos", descripcion: "Gastos realizando en viáticos")
			concepto2 = ConceptoGasto.create(titulo: "Librería", descripcion: "Gastos realizando en librería")
			concepto3 = ConceptoGasto.create(titulo: "Transporte", descripcion: "Gastos realizando en transporte")

		#HABILIDAD
			h1 = Habilidad.create(nombre: "Pintar", descripcion: "Saber pintar con cualquier elemento", tipo_habilidad: TipoHabilidad.find_by(nombre: "Manualidades"))
			h2 = Habilidad.create(nombre: "Programación en Java", descripcion: "Programación en el lenguaje Java", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))
			h3 = Habilidad.create(nombre: "Programación en Python", descripcion: "Programación en el lenguaje Python", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))
			h4 = Habilidad.create(nombre: "Programación en C/C++", descripcion: "Programación en el lenguaje C/C++", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))
			h5 = Habilidad.create(nombre: "Programación en PHP", descripcion: "Programación en el lenguaje PHP", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))
			h6 = Habilidad.create(nombre: "Programación en MySQL", descripcion: "Programación en el lenguaje MySQL", tipo_habilidad: TipoHabilidad.find_by(nombre: "Programación"))
			h7 = Habilidad.create(nombre: "Presentación de Discursos", descripcion: "Habilidad para llevar a delante una charla", tipo_habilidad: TipoHabilidad.find_by(nombre: "Oratoria"))
			h8 = Habilidad.create(nombre: "Armado de Presentaciones", descripcion: "Desarrollo de material audiovisual", tipo_habilidad: TipoHabilidad.find_by(nombre: "Oratoria"))
			h9 = Habilidad.create(nombre: "Contabilidad", descripcion: "Conocimientos de cantabilidad y administracion contable", tipo_habilidad: TipoHabilidad.find_by(nombre: "Administracion"))
			h10 = Habilidad.create(nombre: "Armado de Cartelería", descripcion: "Armado de afiches y posters", tipo_habilidad: TipoHabilidad.find_by(nombre: "Manualidades"))



		#ORGANIZACIONES EXTERNAS
      oex=OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1651654-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1621312-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1213154-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1651154-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1651654-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
      OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1623254-9", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
	  OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1128654-2", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
	  OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1654254-3", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
	  OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1321654-4", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
	  OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1651454-5", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)
	  OrganizacionExterna.create(denominacion: Faker::Company.name, sigla: Faker::Company.suffix, cuit: "30-1636654-6
	  	", fax: Faker::PhoneNumber.cell_phone, telefono: Faker::PhoneNumber.cell_phone, direccion: Faker::Address.street_address, cargoResponsable: Faker::Name.title, numeroContactoResponsable: Faker::PhoneNumber.cell_phone, nombreResponsable: Faker::Name.name)


		#USUARIOS
		uuuu= Usuario.new(nombreUsuario: "admin",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Administrador",
								       email: "admin@sevu.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
											 confirmed_at: Time.now
											 )
		uuuu.skip_confirmation!
		uuuu.save!

    u= Usuario.new(nombreUsuario: "JoelNoguera",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Noguera Joel",
								       email: "one.last.heaven@gmail.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
											 confirmed_at: Time.now
											 )
		u.skip_confirmation!
		u.save!

    u_otro = Usuario.new(nombreUsuario: "AdrianSierra",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Sierra Adrian",
								       email: "adrian@email.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
											 confirmed_at: Time.now
											 )
		u_otro.skip_confirmation!
		u_otro.save!

		uu = Usuario.new(nombreUsuario: "DiegoDiamante",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "DiegoDiamante",
								       email: "diego@diego.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
											 confirmed_at: Time.now
											 )
		uu.skip_confirmation!
		uu.save!

		uuu = Voluntario.new(nombreUsuario: "Pepe",
								       password: password, 
								       password_confirmation: password,  
								       apellido_nombre: "Voluntario",
								       email: "voluntario@voluntario.com",
								       direccion: Faker::Address.street_address,
								       telefono: Faker::PhoneNumber.cell_phone,
								       fax: Faker::PhoneNumber.phone_number,
                       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
											 confirmed_at: Time.now,
												legajo: 32901
											 )
		uuu.skip_confirmation!
		uuu.save!

		un1= Faker::Name.name
		un2= Faker::Name.name
		un3= Faker::Name.name
		un4= Faker::Name.name
		un5= Faker::Name.name
		un6= Faker::Name.name
		un7= Faker::Name.name
		un8= Faker::Name.name
		un9= Faker::Name.name
		un10= Faker::Name.name
		
    u1 =	Usuario.new(nombreUsuario: Faker::Internet.user_name(un1), password: password, password_confirmation: password, apellido_nombre: un1, email: Faker::Internet.email(un1), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample), confirmed_at: Time.now)
		u1.skip_confirmation!
		u1.save!

u2 =	Usuario.new(nombreUsuario: Faker::Internet.user_name(un2), password: password, password_confirmation: password, apellido_nombre: un2, email: Faker::Internet.email(un2), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample), confirmed_at: Time.now)
		u2.skip_confirmation!
		u2.save!

u3 =	Usuario.new(nombreUsuario: Faker::Internet.user_name(un3), password: password, password_confirmation: password, apellido_nombre: un3, email: Faker::Internet.email(un3), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now)
		u3.skip_confirmation!
		u3.save!

u4 =	Usuario.new(nombreUsuario: Faker::Internet.user_name(un4), password: password, password_confirmation: password, apellido_nombre: un4, email: Faker::Internet.email(un4), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now)
		u4.skip_confirmation!
		u4.save!

u5 = 	Usuario.new(nombreUsuario: Faker::Internet.user_name(un5), password: password, password_confirmation: password,  apellido_nombre: un5, email: Faker::Internet.email(un5), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now)
		u5.skip_confirmation!
		u5.save!

u6 =	Usuario.new(nombreUsuario: Faker::Internet.user_name(un6), password: password, password_confirmation: password,  apellido_nombre: un6, email:Faker::Internet.email(un6), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now)
		u6.skip_confirmation!
		u6.save!

u7 =	Voluntario.new(nombreUsuario: Faker::Internet.user_name(un7), password: password, password_confirmation: password, apellido_nombre: un7, email: Faker::Internet.email(un7), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now, legajo: 34532)
		u7.skip_confirmation!
		u7.save!

u8 =	Voluntario.new(nombreUsuario: Faker::Internet.user_name(un8), password: password, password_confirmation: password, apellido_nombre: un8, email: Faker::Internet.email(un8), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now, legajo: 34581)
		u8.skip_confirmation!
		u8.save!

u9 =	Voluntario.new(nombreUsuario: Faker::Internet.user_name(un9), password: password, password_confirmation: password, apellido_nombre: un9, email: Faker::Internet.email(un9), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now, legajo: 34582)
		u9.skip_confirmation!
		u9.save!

u10 =	Voluntario.new(nombreUsuario: Faker::Internet.user_name(un10), password: password, password_confirmation: password, apellido_nombre: un10, email: Faker::Internet.email(un10), direccion: Faker::Address.street_address,  telefono: Faker::PhoneNumber.cell_phone, fax: Faker::PhoneNumber.phone_number, foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),confirmed_at: Time.now,legajo: 34583)
		u10.skip_confirmation!
		u10.save!


	#VOLUNTARIOS

	v = Voluntario.new(nombreUsuario: "agustin",
       password: password, 
       password_confirmation: password,  
       apellido_nombre: "Serrano, Agustin",
       email: "voluntario@email.com",
       direccion: Faker::Address.street_address,
       telefono: Faker::PhoneNumber.cell_phone,
       fax: Faker::PhoneNumber.phone_number,
	 		 legajo: 34587,
       type: 'Voluntario',
       foto: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
			 confirmed_at: Time.now
			 )
		v.skip_confirmation!
		v.save!

		#ESTADO ACADEMICOS

		EstadoAcademico.create(cantidad_materias_aprobadas: 5, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: uu)
		EstadoAcademico.create(cantidad_materias_aprobadas: 6, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: uuu)
		EstadoAcademico.create(cantidad_materias_aprobadas: 7, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u)
		EstadoAcademico.create(cantidad_materias_aprobadas: 8, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: v)
		EstadoAcademico.create(cantidad_materias_aprobadas: 9, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u_otro)
		EstadoAcademico.create(cantidad_materias_aprobadas: 10, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u1)
		EstadoAcademico.create(cantidad_materias_aprobadas: 0, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u2)
		EstadoAcademico.create(cantidad_materias_aprobadas: 2, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u3)
		EstadoAcademico.create(cantidad_materias_aprobadas: 3, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u4)
		EstadoAcademico.create(cantidad_materias_aprobadas: 21, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u5)
		EstadoAcademico.create(cantidad_materias_aprobadas: 40, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u6)
		EstadoAcademico.create(cantidad_materias_aprobadas: 30, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u7)
		EstadoAcademico.create(cantidad_materias_aprobadas: 2, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u8)
		EstadoAcademico.create(cantidad_materias_aprobadas: 3, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u9)
		EstadoAcademico.create(cantidad_materias_aprobadas: 41, cantidad_materias_regulares: 2, cantidad_materias_cursando: 6, usuario: u10)

		#HISTORIAL ESTADO USUARIO

		HistorialEstadoUsuario.create(usuario: v,estado_usuario: eu1, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		HistorialEstadoUsuario.create(usuario: u7,estado_usuario: eu2, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		HistorialEstadoUsuario.create(usuario: u8,estado_usuario: eu2, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		HistorialEstadoUsuario.create(usuario: u9,estado_usuario: eu2, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		HistorialEstadoUsuario.create(usuario: u10,estado_usuario: eu2, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		HistorialEstadoUsuario.create(usuario: uuu,estado_usuario: eu1, created_at: DateTime.new(2015, 1, 15, 18, 0, 0))
		

		#PRIVILEGIOS DE SISTEMA
		AsignacionFuncion.create!(usuario: u, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: uu, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u_otro, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u1, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u2, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u3, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u4, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u5, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u6, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u7, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u8, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u9, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: u10, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: v, rol: rsdiego, esActual: true, descripcion: "default")	
		AsignacionFuncion.create!(usuario: uuu, rol: rsdiego, esActual: true, descripcion: "default")
		AsignacionFuncion.create!(usuario: uuuu, rol: rsdiego, esActual: true, descripcion: "default")
		

		#PRIVILEGIOS DE COORDINADORSISTEMA
		AsignacionFuncion.create!(usuario: u_otro, rol: coordinadorsistema, esActual: true, descripcion: "default")



		#EXPERIENCIA
		e1=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Baja", habilidad: h1, voluntario: v)
		e2=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Media", habilidad: h2, voluntario: uuu)
		e3=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Alta", habilidad: h3, voluntario: u7)


		e1=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Alta", habilidad: h1, voluntario: u8)
		e2=Experiencia.create(tieneExperiencia: true, cantidadExperiencia:  "Media", habilidad: h2, voluntario: u9)
		e3=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Baja", habilidad: h3, voluntario: u10)

		e1=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Alta", habilidad: h1, voluntario: uuu)
		e2=Experiencia.create(tieneExperiencia: true, cantidadExperiencia: "Baja", habilidad: h2, voluntario: u7)
		e3=Experiencia.create(tieneExperiencia: true, cantidadExperiencia:  "Media", habilidad: h3, voluntario: u8)


		#HORARIOS DISPONIBLES

		hd1 = HorarioDisponible.create(diaSemana: '5', horaDesde: DateTime.new(2015, 1, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 1, 15, 18, 0, 0), voluntario: v)
		hd2 = HorarioDisponible.create(diaSemana: '6', horaDesde: DateTime.new(2015, 2, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 2, 15, 17, 0, 0),voluntario: uuu)
		hd3 = HorarioDisponible.create(diaSemana: '7', horaDesde: DateTime.new(2015, 3, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 3, 15, 16, 0, 0),voluntario: u8)
		hd4 = HorarioDisponible.create(diaSemana: '4', horaDesde: DateTime.new(2015, 4, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 4, 15, 15, 0, 0),voluntario: u7)
		hd5 = HorarioDisponible.create(diaSemana: '3', horaDesde: DateTime.new(2015, 5, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 5, 15, 14, 0, 0),voluntario: u10)
		hd6 = HorarioDisponible.create(diaSemana: '15', horaDesde: DateTime.new(2015, 6, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 6, 15, 18, 0, 0),voluntario: u9)
		hd7 = HorarioDisponible.create(diaSemana: '24', horaDesde: DateTime.new(2015, 7, 15, 12, 0, 0), horaHasta: DateTime.new(2015, 7, 15, 17, 0, 0),voluntario: v)
		hd8 = HorarioDisponible.create(diaSemana: '2', horaDesde: DateTime.new(2015, 8, 15, 12, 0, 0), horaHasta:  DateTime.new(2015, 8, 15, 16, 0, 0),voluntario: v)


		#NECESIDAD
    n= Necesidad.create(descripcion: "Queremos comenzar con la investigación en el manejo de autos juntos con la UNC",
			usuario: u,
		    titulo: "Sistema de manejo de auto confiable", ambitoAplicacion: "UTN-FRM")
		n1= Necesidad.create(descripcion: "Debido a la instalación de aires acondicionados y nuevos cableados de redes, las paredes no han quedado en buen estado. Se necesitaría pintarlos.",
			usuario: uu,
		    titulo: "Pintado de laboratorio JAVA", ambitoAplicacion:"Área Sistemas - UTN FRM")
		n2= Necesidad.create(descripcion: "Nos insteresaría poder realizar algún evento de cine para directores independientes.",
			usuario: u_otro,
		    titulo: "Generar algún evento para los amantes de cine casero", ambitoAplicacion: "Secretaría de cultura de la ciudad de Mendoza")
		n3= Necesidad.create(descripcion: "Para la asociación murialdo estamos buscando recolectar juguetes y alimentos para ir a pasar el día con los chicos. Ademas, se permite brindar algún tipo de curso para motivar a los chicos para entrar a la universidad",
			usuario: u_otro,
		    titulo: "Colecta de alimentos y juguetes para el día del niño", ambitoAplicacion: "Club Murialdo")

		#EVENTOS PUBLICOS

		ep1=EventoPublico.create(nombre: "Colecta de alimentos y juguetes", descripcion: "Colecta para los chicos de la asociación murialdo y pasar el dia del niño con ellos.", usuario: u_otro, fechaRealizacion: DateTime.new(2015, 8, 15, 14, 0, 0))

		ep2=EventoPublico.create(nombre: "Pintada masiva del laboratorio de redes", descripcion: "Se necesita mano de obra para pintar el laboratorio de redes", usuario: u_otro, fechaRealizacion: DateTime.new(2015, 12, 3, 16, 30, 0))

	#ASISTENCIA EVENTO PUBLICO

		AsistenciaEvento.create(usuario: v,evento_publico: ep1)
		AsistenciaEvento.create(usuario: uu,evento_publico: ep1)
		AsistenciaEvento.create(usuario: uuu,evento_publico: ep2)
		AsistenciaEvento.create(usuario: u,evento_publico: ep2)


		#PROYECTO 1

			regional=Regional.create(nombre:"UTN-FRM", domicilio: "Rodriguez 505, Mendoza", nombre_contacto: "Beto", telefono_contacto:"0303456")
    p = Proyecto.create(nombre: "Creación de un sistema confiable para Autos", breveDescripcion: "Se desarrollará un sistema para poder manejar un auto sin errores y poder dirigirlo de manera autónoma",
		    fechaInicio: 9.month.ago,
		    fechaFin: DateTime.new(2015, 12, 14, 11, 0, 0),
		    antecedentes: "Ninguno",
		    justificacionProyecto: "Se desea avanzar en el campo de la automaticación en cuanto al tema vehicular",
		    cantidadBeneficiariosDirectos: 100, cantidadBeneficiariosIndirectos: 200,
		    justificacionImpacto: "Se está realizando en conjunto con un grpo de la UNC el cual permitirá la divulgación del proyecto y por ende su impacto",
		    localizacionGeografica: "Mendoza",
		    tipo_proyecto: tipo_proyecto ,
		    necesidad: n, regional: regional)

							#POSTULACIONES

							Postulacion.create(usuario: u7,proyecto: p, aceptado: false)
							Postulacion.create(usuario: v,proyecto: p, aceptado: false)
							Postulacion.create(usuario: u8,proyecto: p, aceptado: false)


							#PRIVILEGIOS DE PROYECTO
							AsignacionRol.create!(proyecto: p , usuario: u, rol: director , esActual: true, active: true)
							AsignacionRol.create!(proyecto: p , usuario: u, rol: voluntario, esActual: true, active: true)
							AsignacionRol.create!(proyecto: p , usuario: u_otro, rol: coordinador , esActual: true, active: true)
							AsignacionRol.create!(proyecto: p , usuario: u_otro, rol: voluntario, esActual: true, active: true)
							AsignacionRol.create!(proyecto: p , usuario: uuu, rol: voluntario, esActual: true, active: true)
				
							#HISTORIAL ESTADO PROYECTO
      				HistorialEstadoProyecto.create(proyecto: p, estado_proyecto: creado, created_at: 1.month.ago )
							HistorialEstadoProyecto.create(proyecto: p, estado_proyecto: enejec)

							#OBJETIVOS
							
							ogg1=ObjetivoGeneral.create(descripcion: "Se analiza los limites, alcances, objetivos y metas del sistema",titulo: "Análisis de requerimientos del sistema" , proyecto: p, active: true)
								oe1=ObjetivoEspecifico.create(descripcion: "Se analizará que información obtener para comprender el sistema",titulo: "Comprender los alcances del sistema",objetivo_general: ogg1, active: true)
								oe2=ObjetivoEspecifico.create(descripcion: "Se analizará quienes son los beneficiarios y cuales son sus necesidades",titulo: "Comprender los objetivos del sistema",objetivo_general: ogg1, active: true)
									a11=Actividad.create(nombre: "Entrevista con el departamento de electronica de la UTN FRM", descripcion: "Se realizarán preguntas a los tecnicos especializados en el tema" , objetivo_especifico: oe1 , proyecto: p, fechaEstimadaInicio: DateTime.new(2015, 1, 15, 12, 0, 0) , duracion: 3, active: true )
									a12=Actividad.create(nombre: "Documentación de los límites", descripcion: "Se realizará la documentación correspondiente." , objetivo_especifico: oe1 , proyecto: p, active: true, fechaEstimadaInicio: DateTime.new(2015, 2, 15, 12, 0, 0) , duracion: 3 )
								a13=Actividad.create(nombre: "Documentación de los alcances", descripcion: "Se realizará la documentación correspondiente." , objetivo_especifico: oe1 , proyecto: p, active: true , fechaEstimadaInicio: DateTime.new(2015, 3, 15, 12, 0, 0) , duracion: 3)
							a14=Actividad.create(nombre: "Documentación de los objetivos", descripcion: "Se realizará la documentación correspondiente." , objetivo_especifico: oe1 , proyecto: p, active: true , fechaEstimadaInicio: DateTime.new(2015, 4, 15, 12, 0, 0) , duracion: 3)
						a15=Actividad.create(nombre: "Documentación de los metas", descripcion: "Se realizará la documentación correspondiente." , objetivo_especifico: oe1 , proyecto: p, active: true , fechaEstimadaInicio: DateTime.new(2015, 5, 15, 12, 0, 0) , duracion: 3)

							og2=ObjetivoGeneral.create(descripcion: "Diseño de la arquitectura del sistema mediante prototipos",titulo: "Diseño del Sistema" , proyecto: p, active: true)

							HistorialEstadoActividad.create(actividad:  a11, estado_actividad: eaa1, created_at: DateTime.new(2015, 1, 15, 12, 0, 0)  )
							HistorialEstadoActividad.create(actividad:  a11, estado_actividad: eaa2, created_at: DateTime.new(2015, 1, 16, 12, 0, 0)   ) 
							HistorialEstadoActividad.create(actividad:  a12, estado_actividad: eaa1, created_at: DateTime.new(2015, 2, 15, 12, 0, 0)   ) 
							HistorialEstadoActividad.create(actividad:  a12, estado_actividad: eaa2, created_at: DateTime.new(2015, 2, 16, 12, 0, 0)   ) 
							HistorialEstadoActividad.create(actividad:  a13, estado_actividad: eaa1 , created_at: DateTime.new(2015, 3, 15, 12, 0, 0)  )
							HistorialEstadoActividad.create(actividad:  a13, estado_actividad: eaa2, created_at: DateTime.new(2015, 3, 16, 12, 0, 0)   ) 
							HistorialEstadoActividad.create(actividad:  a14, estado_actividad: eaa1, created_at: DateTime.new(2015, 4, 15, 12, 0, 0)   )
							HistorialEstadoActividad.create(actividad:  a14, estado_actividad: eaa2, created_at: DateTime.new(2015, 4, 16, 12, 0, 0)   ) 
							HistorialEstadoActividad.create(actividad:  a15, estado_actividad: eaa1 , created_at: DateTime.new(2015, 5, 15, 12, 0, 0)  )
							HistorialEstadoActividad.create(actividad:  a15, estado_actividad: eaa2, created_at: DateTime.new(2015, 5, 16, 12, 0, 0)   ) 

							Requisito.create(actividad: a11, habilidad: h7)

							#PRESUPUESTO 
							presupuesto = Presupuesto.create(fechaPresentacion: 1.year.from_now, montoTotal: 23, aprobado: false, proyecto: p, usuario: u)

										#DETALLE PRESUPUESTO
										DetallePresupuesto.create(titulo: "Almuerzo", descripcion: "Se gastará en un almuerzo", monto: 15, presupuesto: presupuesto, concepto_gasto: concepto1)
										DetallePresupuesto.create(titulo: "Cuadernos", descripcion: "Se gastará en un cuaderno para escribir", monto: 8, presupuesto: presupuesto, concepto_gasto: concepto2)

							#INFORME GASTOS
							informe_gasto = InformeGasto.create(montoTotal: 23, proyecto: p)

										#DETALLE GASTOS
										DetalleGasto.create(titulo: "Almuerzo", descripcion: "Se gastó en un almuerzo", monto: 10, informe_gasto_id: informe_gasto.id, concepto_gasto: concepto1)
										DetalleGasto.create(titulo: "Cuadernos", descripcion: "Se gastó en un cuaderno para escribir", monto: 5, informe_gasto_id: informe_gasto.id, concepto_gasto: concepto2)

							aaaa=AsignacionActividad.create(actividad: a11, usuario: uuu,vigente: true)
							AsignacionActividad.create(actividad: a11, usuario: u,vigente: true)
							AsignacionActividad.create(actividad: a11, usuario: u_otro,vigente: true)
							Reporte.create(asignacion_actividad: aaaa, descripcion: "La actividad fue asombrosa")
							Colaborador.create(proyecto: p,organizacion_externa: oex)

  end

end
