class Ability
  include CanCan::Ability
	def initialize(user)
		user ||= Usuario.new
		if user.nombreUsuario== 'admin'# Superusuario
			can :manage, :all
		else
			AsignacionFuncion.all.each do |asignacionfuncion| #Privilegios de Sistema
				if asignacionfuncion.usuario == user && asignacionfuncion.esActual?	
					AsignacionRolPredefinido.all.each do |asignacionrolpredefinido|

					if asignacionrolpredefinido.esActual?
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'necesidad_publico').id					
								can :manage, Necesidad
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto_publico').id 						
								can :index, Proyecto
								can :mis_proyectos, Proyecto
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto').id 						
								can :manage, Proyecto
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_evento_publico').id 							
								can :index, EventoPublico
								can :show, EventoPublico
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'evento_publicos').id							
								can :manage, EventoPublico
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'regional').id 				
								can :manage, Regional
								can :configuraciones_generales, Rol
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'nota').id 				
								can :manage, Nota
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'horarios_disponibles').id 				
								can :manage, HorarioDisponible
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'asignacion_rol_predefinido').id 				
								can :manage, AsignacionRolPredefinido
								can :configuraciones_generales, Rol
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'experiencia').id 				
								can :manage, Experiencia
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'configuraciones_generales').id
								can :manage, Rol
								can :configuraciones_generales, Rol
								can :manage, Usuario
								can :manage, Regional
								can :manage, TipoRol
								can :manage, Privilegio
								can :manage, TipoPrivilegio
								can :manage, AsignacionRolPredefinido
								can :manage, AsignacionFuncion
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'asistencia_evento').id 				
								can :manage, AsistenciaEvento
						end

					end
				end
				end
			end
			AsignacionRol.all.each do |asignacionrol| #Privilegios de Proyecto
				if asignacionrol.usuario == user && asignacionrol.esActual?
					AsignacionRolPredefinido.all.each do |asignacionrolpredefinido|
					if asignacionrolpredefinido.esActual?
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'detalle_presupuestos').id 						
								can :manage, DetallePresupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'reporte_generado').id 						
								can :reporte_new, ReporteGenerado
								can :reporte_voluntarios, ReporteGenerado
								can :reporte_proyectos, ReporteGenerado	
								can :reporte_regionales, ReporteGenerado
							  can :reporte_generado, ReporteGenerado
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'asignacion_roles').id 						
								can :manage, AsignacionRol
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_organizacion_externas').id 				
								can :show, OrganizacionExterna
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'estado_proyecto_historial').id 
								can :show, HistorialEstadoProyecto
								can :edit, EstadoProyecto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'informe_gastos').id 
								can :manage, InformeGasto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_index_informe_gasto').id 
								can :show, InformeGasto
							  can :index, InformeGasto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_detalle_gastos').id 
								can :show, DetalleGasto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'comprobantes').id 
								can :manage, Comprobante
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'concepto_gastos').id 
								can :manage, ConceptoGasto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto_publico').id 
								can :show, Proyecto
								can :show, Actividad
								can :show, ObjetivoGeneral
								can :show, ObjetivoEspecifico
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'edit_proyecto').id 
								can :edit, Proyecto
								can :show, OrganizacionExterna
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'tipo_proyectos').id 
								can :manage, TipoProyecto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'habilidades').id 
								can :manage, Habilidad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'tipo_habilidades').id 
								can :manage, TipoHabilidad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificacion_predeterminadas').id 
								can :manage, NotificacionPredeterminada
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificacion_sistema').id 
								can :manage, NotificacionSistema
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'new_presupuesto').id 
								can :new, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'edit_presupuesto').id 
								can :edit, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'restricciones').id 
								can :manage, Restriccion
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_new_postulacion').id 
								can :show, Postulacion
								can :new, Postulacion
						end

						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificacion_mailer').id 
								can :manage, NotificacionMailer
						end

						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_show_actividad').id 
								can :show, Actividad
								can :index, Actividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_show_asignacion_actividades').id 
								can :show, Actividad
								can :index, Actividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_show_asignacion_roles').id 
								can :show, Actividad
								can :index, Actividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_show_objetivos').id 
								can :show, ObjetivoGeneral
								can :index, ObjetivoGeneral
								can :show, ObjetivoEspecifico
								can :index, ObjetivoEspecifico
						end

						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'edit_actividad').id 
								can :edit, Actividad
								can :show, Actividad
								can :manage, DetalleGasto
								can :manage, Comprobante
								can :manage, Reporte
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'reporte').id 
								can :manage, Reporte
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'detalle_gasto').id 
								can :manage, DetalleGasto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'manage_postulacion').id 
								can :manage, Postulacion
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'asignacion_actividad').id 
								can :manage, AsignacionActividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'actividad').id 
								can :manage, Actividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'objetivos').id 
								can :manage, ObjetivoGeneral
								can :manage, ObjetivoEspecifico
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'organizacion_externas').id 				
								can :manage, OrganizacionExterna
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'tipo_actividad').id 				
								can :manage, TipoActividad
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto').id 				
								can :manage, Proyecto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto_director').id 				
								can :show, Proyecto
								can :edit, Proyecto
						end
											
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'reporte_generado').id 				
								can :manage, ReporteGenerado
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'colaborador').id 				
								can :manage, Colaborador
						end
						
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'requisito').id 				
								can :manage, Requisito
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'comprobante').id 				
								can :manage, Comprobante
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'create_show_presupuestos').id 						
								can :create, Presupuesto
								can :show, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'presupuestos').id 						
								can :manage, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificacion_email').id 						
								can :manage, NotificacionEmail

						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificaciones').id 						
								can :manage, Notificacion

						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'transacciones').id 						
								can :auditoria, Transaccion
								can :control_fecha, Transaccion
								can :control_proyecto, Transaccion
								can :control_usuario, Transaccion

						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_index_historial_estado_proyecto').id 						
								can :show, HistorialEstadoProyecto
								can :index, HistorialEstadoProyecto

						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_index_historial_estado_usuario').id 						
								can :show, HistorialEstadoUsuario
								can :index, HistorialEstadoUsuario

						end
						
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_index_historial_estado_actividad').id 						
								can :show, HistorialEstadoActividad
								can :index, HistorialEstadoActividad

						end
					end
				end
			end
		end
	end
	end
end

