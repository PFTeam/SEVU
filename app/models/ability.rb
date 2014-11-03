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
						#PAGINA PRINCIPAL------------------------------------------------------------
					if asignacionrolpredefinido.esActual?
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'necesidad_publico').id					
								can :index, Necesidad
								can :mis_necesidades, Necesidad
								can :new, Necesidad
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'proyecto_publico').id 						
								can :index, Proyecto
								can :mis_proyectos, Proyecto
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_evento_publico').id 							
								can :index, EventoPublico
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'evento_publicos').id							
								can :manage, EventoPublico
						end
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'notificaciones').id 				
								can :manage, Notificaciones
						end
						
						#TRANSACCIONES/USUARIOS/SESIONES/TIPOTRANSACCIONES---------------------------------------
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'auditoria').id 							
								can :auditoria, Transaccion
								can :control_fecha, Transaccion
								can :control_proyecto, Transaccion
								can :control_usuario, Transaccion
								can :manage, Transaccion
								can :manage, TipoTransaccion
								can :manage, Usuario
								can :manage, Sesiones
						end
							#ROLES/TIPOROL/PRIVILEGIO/TIPOPRIVILEGIO/ASIGNACIONROLPREDEFINIDO/ASIGNACIONFUNCION---------------------------------------
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'configuraciones_generales').id
								can :manage, Rol
								can :configuraciones_generales, Rol
								can :manage, Regional
								can :manage, TipoRol
								can :manage, Privilegio
								can :manage, TipoPrivilegio
								can :manage, AsignacionRolPredefinido
								can :manage, AsignacionFuncion
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
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'detalle_gastos').id 
								can :manage, DetalleGasto
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
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'new_presupuesto').id 
								can :new, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'edit_presupuesto').id 
								can :edit, Presupuesto
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'restricciones').id 
								can :manage, Restriccion
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'show_postulacion').id 
								can :show, Postulacion
						end
						if asignacionrolpredefinido.rol==asignacionrol.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'edit_actividad').id 
								can :edit, Actividad
								can :manage, DetalleGasto
								can :manage, Comprobante
								can :manage, Reporte
						end
						

								#Dependiendo de los privilegios que cada uno necesite, por ejemplo si solo queres permitir con un privilegio que edite actividades, entonces lo llamas edit_actividades y pones can :edit, Actividades. Tener en cuenta que falta en el ultimo condicional el filtro por proyecto. Pueden unir permisos si es que se relacionan como lo hice arriba. Faltan todos los que corresponden a proyecto (si alguno es de sistema y se me paso por favor de avisar): actividades, asignacion_actividades, asignacion_roles, asignacion_eventos, colaboradores, comprobantes, conceptos_gastos, detalle_gastos, detalle_presupuesto, detalle_restricciones, estado_actividades, estado_presupuestos, estado_proyectos, estado_usuarios, evento_publicos, experiencias, habilidades, historial_estado_actividades, historial_estado_presupuestos, historial_estado_proyectos, historial_estado_usuarios, horario_disponibles, informe_gastos, necesidades, notas, notificacion_emailes, notificaciones, notificacion_predeterminadas, notificacion_sistemas, objetivo_especificos, objetivo_generales, organizacion_externas, postulaciones, presupuestos, proyectos, reportes_generados, reportes, requisitos, restricciones, tipo_actividades, tipo_habilidades, tipo_notificaciones, tipo_proyectos, voluntarios.
					end
				end
			end
		end
	end
	end
end

