#!/bin/bash
rails generate scaffold EstadoProyecto nombre:string
rails generate scaffold TipoProyecto nombre:string descripcion:text
rails generate scaffold EstadoActividad nombre:string
rails generate scaffold TipoNotificacion nombre:string
rails generate scaffold TipoActividad titulo:string descripcion:text
rails generate scaffold TipoHabilidad nombre:string descripcion:text
rails generate scaffold TipoRol nombre:string descripcion:text
rails generate scaffold OrganizacionExterna sigla:string denominacion:string cuit:string direccion:string fax:string telefono:string nombreResponsable:string cargoResponsable:string numeroContactoResponsable:string
rails generate scaffold Comprobante numero:int
rails generate scaffold TipoTransaccion descripcion:string
rails generate scaffold EstadoPresupuesto nombre:string
rails generate scaffold EstadoUsuario nombre:string
rails generate scaffold ConceptoGasto titulo:string descripcion:text
rails generate scaffold TipoPrivilegio nombre:string descripcion:text
rails generate scaffold Usuario nombreUsuario:string contrasenia:string apellidoNombre:string email:string direccion:string fechaRegistro:date
rails generate scaffold Voluntario legajo:int --parent=Usuario
rails generate scaffold Necesidad descripcion:text fechaCreacion:date ambitoAplicacion:text usuario:references
rails generate scaffold Proyecto nombre:string breveDescripcion:text fechaInicio:date fechaFin:date antecedentes:text justificacionProyecto:text cantidadBeneficiariosDirectos:int cantidadBeneficiariosIndirectos:int justificacionImpacto:text  localizacionGeografica:text tipo_proyecto:references necesidad:references
rails generate scaffold HistorialestadoProyecto fechaCambioEstado:date esActual:boolean estado_proyecto:references proyecto:references
rails generate scaffold ObjetivoGeneral titulo:string description:text proyecto:references
rails generate scaffold ObjetivoEspecifico titulo:string descripcion:text objetivo_general:references
rails generate scaffold Actividad nombre:string descripcion:text duracion:int duracionReal:int fechaEstimadaInicio:date fechaRealInicio:date estrategiasIntervencion metodologiasIntervencion:text mecanismoEvaluacion:text resultadosEsperados:text objetivo_especifico:references proyecto:references tipo_actividad:references
rails generate scaffold HistorialEstadoActividad fechaCambioEstado:date esActual:boolean actividad:references estado_actividad:references
#Join Table Tipo Notificacion y Proyecto
rails generate scaffold ProyectoTipoNotificacion proyecto:references tipo_notificacion:references
#
rails generate scaffold Habilidad nombre:string descripcion:text tipo_habilidad:references
rails generate scaffold ActividadHabilidad actividad:references habilidad:references
rails generate scaffold Experiencia tieneExperiencia:boolean cantidadExperiencia:int habilidad:references voluntario:references
rails generate scaffold AsignacionActividad vigente:boolean fechaAsignacion:date actividad:references usuario:references
rails generate scaffold Reporte fechaCreacion:date descripcion:text asignacion_actividad:references
rails generate scaffold HorarioDisponible diaSemana:string horaDesde:date horaHasta:date voluntario:references
rails generate scaffold Rol nombre:string descripcion:text tipo_rol:references
rails generate scaffold AsignacionRolProyecto fechaCambioEstado:date esActual:boolean rol:references proyecto:references usuario:references
rails generate scaffold NotaPersonal titulo:string descripcion:text fechaCreacion:date voluntario:references usuario:references
rails generate scaffold PostulacionVoluntariado fechaPostulacion:date aceptado:boolean proyecto:references usuario:references
rails generate scaffold Restriccion fechaDesde:date fechaHasta:date esActiva:boolean tipo_proyecto:references
rails generate scaffold DetalleRestriccion esActiva:boolean fechaDesde:date fechaHasta:date montoMax:float restriccion:references concepto_gasto:references
rails generate scaffold InformeGastos montoTotal:float proyecto:references
rails generate scaffold EventoPublico nombre:string descripcion:text fechaRealizacion:date usuario:references
rails generate scaffold Notificacion fechaNotificacion:date horaNotificacion:date esActiva:boolean mensaje:text notificado:boolean usuarioCreador:references usuarioDestino:references evento_publico:references proyecto:references
rails generate scaffold NotificacionEmail destinatario:string remitente:string asunto:string --parent=Notificacion
rails generate scaffold NotificacionSistema --parent=Notificacion
rails generate scaffold Privilegio nombre:string descripcion:text tipo_privilegio:references
rails generate scaffold AsignacionRolPredefinido fechaAsignacion:date esActual:boolean privilegio:references rol:references
rails generate scaffold AsistenciaEventoPublico fechaCreacion:date evento_publico:references usuario:references
rails generate scaffold AsignacionRolSistema fechaAsignacion:date esActual:boolean descripcion:text usuario:references rol:references
rails generate scaffold HistorialEstadoUsuario fechaCambioEstado:date esActual:boolean usuario:references estado_usuario:references
rails generate scaffold Sesion fechaInicio:date fechaFin:date usuario:references
rails generate scaffold Transaccion descripcion:text fechaTransaccion:date proyecto:references tipo_transaccion:references sesion:references
rails generate scaffold DetalleGasto titulo:string descripcion:text monto:float concepto_gasto:references informe_gastos:references voluntario:references comprobante:references
rails generate scaffold Presupuesto fechaPresentacion:date montoTotal:int aprobado:boolean proyecto:references restriccion:references usuario:references
rails generate scaffold HistorialEstadoPresupuesto esActual:boolean fechaCambioEstado:date presupuesto:references estado_presupuesto:references
rails generate scaffold DetallePresupuesto titulo:string descripcion:text monto:float presupuesto:references concepto_gasto:references




