#!/bin/bash
rails generate scaffold EstadoProyecto nombre:string
rails generate scaffold TipoProyecto nombre:string descripcion:text
rails generate scaffold EstadoActividad nombre:string
rails generate scaffold TipoNotificacion nombre:string
rails generate scaffold TipoActividad titulo:string descripcion:text
rails generate scaffold TipoHabilidad nombre:string descripcion:text
rails generate scaffold TipoRol nombre:string descripcion:text
rails generate scaffold OrganizacionExterna sigla:string denominacion:string cuit:string direccion:string fax:string telefono:string nombreResponsable:string cargoResponsable:string numeroContactoResponsable:string
rails generate scaffold Comprobante numero:integer
rails generate scaffold TipoTransaccion descripcion:string
rails generate scaffold EstadoPresupuesto nombre:string
rails generate scaffold EstadoUsuario nombre:string
rails generate scaffold ConceptoGasto titulo:string descripcion:text
rails generate scaffold TipoPrivilegio nombre:string descripcion:text
rails generate scaffold Usuario nombreUsuario:string contrasenia:string apellidoNombre:string email:string direccion:string fechaRegistro:datetime
rails generate scaffold Voluntario legajo:integer --parent=Usuario
rails generate scaffold Necesidad descripcion:text fechaCreacion:datetime ambitoAplicacion:text usuario:references
rails generate scaffold Proyecto nombre:string breveDescripcion:text fechaInicio:date fechaFin:date antecedentes:text justificacionProyecto:text cantidadBeneficiariosDirectos:integer cantidadBeneficiariosIndirectos:integer justificacionImpacto:text  localizacionGeografica:text tipo_proyecto:references necesidad:references
rails generate scaffold HistorialEstadoProyecto fechaCambioEstado:datetime esActual:boolean estado_proyecto:references proyecto:references
rails generate scaffold ObjetivoGeneral titulo:string description:text proyecto:references
rails generate scaffold ObjetivoEspecifico titulo:string descripcion:text objetivo_general:references
rails generate scaffold Actividad nombre:string descripcion:text duracion:integer duracionReal:integer fechaEstimadaInicio:date fechaRealInicio:date estrategiasIntervencion metodologiasIntervencion:text mecanismoEvaluacion:text resultadosEsperados:text objetivo_especifico:references proyecto:references tipo_actividad:references
rails generate scaffold HistorialEstadoActividad fechaCambioEstado:datetime esActual:boolean actividad:references estado_actividad:references
#Join Table Tipo Notificacion y Proyecto
rails generate scaffold NotificacionPredeterminada proyecto:references tipo_notificacion:references
#
rails generate scaffold Habilidad nombre:string descripcion:text tipo_habilidad:references
rails generate scaffold Requisito actividad:references habilidad:references
rails generate scaffold Experiencia tieneExperiencia:boolean cantidadExperiencia:integer habilidad:references voluntario:references
rails generate scaffold AsignacionActividad vigente:boolean fechaAsignacion:datetime actividad:references usuario:references
rails generate scaffold Reporte fechaCreacion:datetime descripcion:text asignacion_actividad:references
rails generate scaffold HorarioDisponible diaSemana:string horaDesde:time horaHasta:time voluntario:references
rails generate scaffold Rol nombre:string descripcion:text tipo_rol:references
rails generate scaffold AsignacionRol fechaCambioEstado:datetime esActual:boolean rol:references proyecto:references usuario:references
rails generate scaffold Nota titulo:string descripcion:text fechaCreacion:datetime voluntario:references usuario:references
rails generate scaffold Postulacion fechaPostulacion:datetime aceptado:boolean proyecto:references usuario:references
rails generate scaffold Restriccion fechaDesde:datetime fechaHasta:datetime esActiva:boolean tipo_proyecto:references
rails generate scaffold DetalleRestriccion esActiva:boolean fechaDesde:datetime fechaHasta:datetime montoMax:float restriccion:references concepto_gasto:references
rails generate scaffold InformeGastos montoTotal:float proyecto:references
rails generate scaffold EventoPublico nombre:string descripcion:text fechaRealizacion:datetime usuario:references
rails generate scaffold Notificacion fechaNotificacion:date horaNotificacion:time esActiva:boolean mensaje:text notificado:boolean usuarioCreador:references usuarioDestino:references evento_publico:references proyecto:references
rails generate scaffold NotificacionEmail destinatario:string remitente:string asunto:string --parent=Notificacion
rails generate scaffold NotificacionSistema --parent=Notificacion
rails generate scaffold Privilegio nombre:string descripcion:text tipo_privilegio:references
rails generate scaffold AsignacionRolPredefinido fechaAsignacion:datetime esActual:boolean privilegio:references rol:references
rails generate scaffold AsistenciaEvento fechaCreacion:datetime evento_publico:references usuario:references
rails generate scaffold AsignacionFuncion fechaAsignacion:datetime esActual:boolean descripcion:text usuario:references rol:references
rails generate scaffold HistorialEstadoUsuario fechaCambioEstado:datetime esActual:boolean usuario:references estado_usuario:references
rails generate scaffold Sesion fechaInicio:datetime fechaFin:datetime usuario:references
rails generate scaffold Transaccion descripcion:text fechaTransaccion:datetime proyecto:references tipo_transaccion:references sesion:references
rails generate scaffold DetalleGasto titulo:string descripcion:text monto:float concepto_gasto:references informe_gastos:references voluntario:references comprobante:references
rails generate scaffold Presupuesto fechaPresentacion:datetime montoTotal:integer aprobado:boolean proyecto:references restriccion:references usuario:references
rails generate scaffold HistorialEstadoPresupuesto esActual:boolean fechaCambioEstado:datetime presupuesto:references estado_presupuesto:references
rails generate scaffold DetallePresupuesto titulo:string descripcion:text monto:float presupuesto:references concepto_gasto:references
#Agregados
rails generate scaffold Colaborador organizacion_externa:references proyecto:references


