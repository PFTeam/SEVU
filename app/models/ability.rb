class Ability
  include CanCan::Ability
	def initialize(user)
		user ||= Usuario.new
		if user.nombreUsuario== 'admin'# Superusuario
			can :manage, :all
		else
			user.asignacion_funciones.where(esActual: true).each do |asignacionfuncion|
					asignacionfuncion.rol.asignacion_rol_predefinidos.where(esActual: true).each do |asignacionrolpredefinido|
						case asignacionrolpredefinido.privilegio.nombre
							when 'necesidad_publico'
								can :manage, Necesidad
								can :mis_necesidades, Necesidad
							when 'proyecto_publico'
								can :index, Proyecto
								can :mis_proyectos, Proyecto
							when 'new_postulacion'
								can [:new, :create], Postulacion
							when 'notificacion_sistema'
								can :manage, NotificacionSistema
							when 'notificacion_email'
								can :manage, NotificacionEmail
							when 'notificaciones'
								can :manage, Notificacion
							when 'notificacion_mailer'
								can :manage, NotificacionMailer
							when 'notificacion_predeterminadas'
								can :configuraciones_generales, Rol
								can :manage, NotificacionPredeterminada
								can :gestionar_notificaciones, NotificacionPredeterminada
								can :notificaciones_predeterminadas, NotificacionPredeterminada
							when 'proyecto'
								can :manage, Proyecto
								can :agregar_necesidad, Proyecto
							when 'edit_update_usuario'
								can :edit, Usuario
								can :update, Usuario
								can :dar_alta_voluntario, Usuario
							when 'index_evento_publico'
								can :index, EventoPublico
								can :show, EventoPublico
							when 'evento_publicos'
								can :manage, EventoPublico
							when 'regional'
								can :manage, Regional
								can :configuraciones_generales, Rol
							when 'nota'
								can :manage, Nota
								can :responder, Nota
							when 'horarios_disponibles'
								can :manage, HorarioDisponible
							when 'asignacion_rol'
								can :manage, AsignacionRol
							when 'asignacion_rol_predefinido'
								can :manage, AsignacionRolPredefinido
								can :configuraciones_generales, Rol
							when 'experiencia'
								can :manage, Experiencia
							when 'configuraciones_generales'
								can :manage, Rol
								can :configuraciones_generales, Rol
								can :manage, Usuario
								can :manage, TipoRol
								can :manage, Privilegio
								can :manage, TipoPrivilegio
								can :manage, AsignacionRolPredefinido
								can :manage, AsignacionFuncion
							when 'asistencia_evento'
								can :manage, AsistenciaEvento
							when 'index_usuario'
								can :index, Usuario
						end
					end
				end
			user.asignacion_roles.where(esActual: true).each do |asignacionrol|
				asignacionrol.rol.asignacion_rol_predefinidos.where(esActual: true).each do |asignacionrolpredefinido|
					case asignacionrolpredefinido.privilegio.nombre
						when 'detalle_presupuestos'
							can :manage, DetallePresupuesto, presupuesto: asignacionrol.proyecto.presupuesto
						when 'reporte_generado'
							can :reporte_new, ReporteGenerado
							can :reporte_voluntarios, ReporteGenerado
							can :reporte_proyectos, ReporteGenerado	
							can :reporte_regionales, ReporteGenerado
						  can :reporte_generado, ReporteGenerado
						when 'estado_academico'
							can :index, EstadoAcademico
						when 'asignacion_roles'
							can :manage, AsignacionRol
						when 'show_organizacion_externas'
							can :show, OrganizacionExterna, id: asignacionrol.proyecto.organizacion_externas.pluck(:id)
						when 'estado_proyecto_historial'
							can :show, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
							can :edit, EstadoProyecto
						when 'informe_gastos'
							can :manage, InformeGasto, proyecto: asignacionrol.proyecto
							can :gestionar_informe_gastos, InformeGasto, proyecto: asignacionrol.proyecto
						when 'show_index_informe_gasto'
							can :show, InformeGasto, proyecto: asignacionrol.proyecto
							can :index, InformeGasto, proyecto: asignacionrol.proyecto
						when 'show_detalle_gastos'
							can :show, DetalleGasto, id: asignacionrol.proyecto.informe_gasto.detalle_gastos.pluck(:id)
						when 'comprobantes'
							can :manage, Comprobante, detalle_gasto: asignacionrol.proyecto.informe_gasto.detalle_gastos.pluck(:id)
						when 'concepto_gastos'
							can :configuraciones_generales, Rol
							can :manage, ConceptoGasto
							can :gestionar_concepto_gastos, ConceptoGasto
						when 'proyecto_voluntario'
							can :show, Proyecto, id: asignacionrol.proyecto
							can :show, Actividad, proyecto: asignacionrol.proyecto
							can :show, ObjetivoGeneral, proyecto: asignacionrol.proyecto
							can :show, ObjetivoEspecifico, objetivo_general: asignacionrol.proyecto.objetivo_generales.pluck(:id)
						when 'edit_proyecto'
							can :edit, Proyecto, id: asignacionrol.proyecto
							can :agregar_necesidad, Proyecto, id: asignacionrol.proyecto
							can :show, OrganizacionExterna, id: asignacionrol.proyecto.organizacion_externas.pluck(:id)
						when 'tipo_proyectos'
							can :manage, TipoProyecto, id: asignacionrol.proyecto.tipo_proyecto
						when 'habilidades'
							can :configuraciones_generales, Rol
							can :manage, Habilidad
						when 'tipo_habilidades'
							can :configuraciones_generales, Rol
							can :manage, TipoHabilidad
							can :gestionar_habilidades, TipoHabilidad
						when 'new_presupuesto'
							can :new, Presupuesto, id: asignacionrol.proyecto.presupuesto
						when 'edit_presupuesto'
							can :edit, Presupuesto, id: asignacionrol.proyecto.presupuesto
						when 'restricciones'
							can :manage, Restriccion
							can :gestionar_restricciones, Restriccion
						when 'index_show_actividad'
							can :show, Actividad, proyecto: asignacionrol.proyecto
							can :index, Actividad, proyecto: asignacionrol.proyecto
						when 'index_show_asignacion_actividades'
							can :show, AsignacionActividad, actividad: asignacionrol.proyecto.actividades.pluck(:id)
							can :index, AsignacionActividad, actividad: asignacionrol.proyecto.actividades.pluck(:id)
						when 'index_show_asignacion_roles'
							can :show, AsignacionRol
							can :index, AsignacionRol
						when 'index_show_objetivos'
							can :show, ObjetivoGeneral, proyecto: asignacionrol.proyecto
							can :index, ObjetivoGeneral, proyecto: asignacionrol.proyecto
							can :show, ObjetivoEspecifico, objetivo_general: asignacionrol.proyecto.objetivo_generales.pluck(:id)
							can :index, ObjetivoEspecifico, objetivo_general: asignacionrol.proyecto.objetivo_generales.pluck(:id)
						when 'edit_actividad'
							can :edit, Actividad, proyecto: asignacionrol.proyecto
							can :show, Actividad, proyecto: asignacionrol.proyecto
							can :manage, DetalleGasto, id: asignacionrol.proyecto.informe_gasto.detalle_gastos.pluck(:id)
							can :manage, Comprobante
							can :manage, Reporte
						when 'reporte'
							can :manage, Reporte
						when 'detalle_gasto'
							can :manage, DetalleGasto, id: asignacionrol.proyecto.informe_gasto.detalle_gastos.pluck(:id)
						when 'manage_postulacion'
							can :manage, Postulacion, proyecto: asignacionrol.proyecto
						when 'asignacion_actividad'
							can :manage, AsignacionActividad, actividad: asignacionrol.proyecto.actividades.pluck(:id)
							can :busqueda_filtrada, AsignacionActividad, actividad: asignacionrol.proyecto.actividades.pluck(:id)
						when 'actividad'
							can :manage, Actividad, proyecto: asignacionrol.proyecto
							can :show, Usuario
							can :agregar_habilidad, Actividad
						when 'objetivos'
							can :manage, ObjetivoGeneral, proyecto: asignacionrol.proyecto
							can :manage, ObjetivoEspecifico, objetivo_general: asignacionrol.proyecto.objetivo_generales.pluck(:id)
						when 'organizacion_externas'
							can :manage, OrganizacionExterna, id: asignacionrol.proyecto.organizacion_externas.pluck(:id)
						when 'tipo_actividad'
							can :manage, TipoActividad
						when 'proyecto'
							can :manage, Proyecto, id: asignacionrol.proyecto
							can :show, Usuario
							can :agregar_necesidad, Proyecto, id: asignacionrol.proyecto
						when 'proyecto_director'
							can :show, Proyecto, id: asignacionrol.proyecto
							can :edit, Proyecto, id: asignacionrol.proyecto
							can :agregar_necesidad, Proyecto, id: asignacionrol.proyecto
						when 'reporte_generado'
							can :manage, ReporteGenerado
						when 'colaborador'
							can :manage, Colaborador, proyecto: asignacionrol.proyecto
						when 'requisito'
							can :manage, Requisito
						when 'comprobante'
							can :manage, Comprobante
						when 'create_show_presupuestos'
							can :create, Presupuesto, id: asignacionrol.proyecto.presupuesto
							can :show, Presupuesto, id: asignacionrol.proyecto.presupuesto
						when 'presupuestos'
							can :manage, Presupuesto, id: asignacionrol.proyecto.presupuesto
							can :gestionar_presupuesto, Presupuesto, id: asignacionrol.proyecto.presupuesto
							can :evaluar_presupuestos_pendientes, Presupuesto
							can :presupuestos_evaluados, Presupuesto
							can :evaluar_presupuesto, Presupuesto, id: asignacionrol.proyecto.presupuesto
						when 'gestionar_presupuesto'
							can :gestionar_presupuesto, Presupuesto, id: asignacionrol.proyecto.presupuesto
						when 'transacciones'
							can :auditoria, Transaccion
							can :control_fecha, Transaccion
							can :control_proyecto, Transaccion
							can :control_usuario, Transaccion
						when 'show_index_historial_estado_proyecto'
							can :show, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
							can :index, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
							can :modificar, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
							can :edit, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
							can :update, HistorialEstadoProyecto, proyecto: asignacionrol.proyecto
						when 'show_index_historial_estado_usuario'
							can :show, HistorialEstadoUsuario
							can :index, HistorialEstadoUsuario
						when 'gestionar_estado_presupuesto'
							can :gestionar_estados_presupuestos, EstadoPresupuesto
						when 'show_index_historial_estado_actividad'
							can :show, HistorialEstadoActividad
							can :index, HistorialEstadoActividad
							can :edit, HistorialEstadoActividad
							can :update, HistorialEstadoActividad
						when 'voluntarios'
							can :mis_notas, Voluntario
							can :gestionar_nota_P, Voluntario
							can :gestion_horarios_disponibles, Voluntario
							can :gestionar_estado_usuario, Voluntario
							can :Responder, Voluntario #SIN autorize en controlador
							can :dar_alta_voluntario, Voluntario #SIN autorize en controlador
							can :gestionar_habilidades, Voluntario #SIN autorize en controlador
					end
				end
			end
		end
	end
end

