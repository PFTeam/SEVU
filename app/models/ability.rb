class Ability
  include CanCan::Ability
	def initialize(user)
		user ||= Usuario.new
		if user.nombreUsuario== 'admin'# Superusuario
			can :manage, :all
		else
			AsignacionFuncion.all.each do |asignacionfuncion| #Privilegios de Sistema
				if asignacionfuncion.usuario == user
					AsignacionRolPredefinido.all.each do |asignacionrolpredefinido|
						#PAGINA PRINCIPAL------------------------------------------------------------
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'index_necesidad').id								
								can :index, Necesidad
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
						if asignacionrolpredefinido.rol==asignacionfuncion.rol && asignacionrolpredefinido.privilegio.id==(Privilegio.find_by! nombre: 'roles').id
								can :manage, Rol
								can :manage, TipoRol
								can :manage, Privilegio
								can :manage, TipoPrivilegio
								can :manage, AsignacionRolPredefinido
								can :manage, AsignacionFuncion
						end
					end
				end
			end
			AsignacionRol.all.each do |asignacionrol| #Privilegios de Proyecto
				if asignacionrol.usuario == user
					AsignacionRolPredefinido.all.each do |asignacionrolpredefinido|
						

								#Dependiendo de los privilegios que cada uno necesite, por ejemplo si solo queres permitir con un privilegio que edite actividades, entonces lo llamas edit_actividades y pones can :edit, Actividades. Tener en cuenta que falta en el ultimo condicional el filtro por proyecto. Pueden unir permisos si es que se relacionan como lo hice arriba. Faltan todos los que corresponden a proyecto (si alguno es de sistema y se me paso por favor de avisar): actividades, asignacion_actividades, asignacion_roles, asignacion_eventos, colaboradores, comprobantes, conceptos_gastos, detalle_gastos, detalle_presupuesto, detalle_restricciones, estado_actividades, estado_presupuestos, estado_proyectos, estado_usuarios, evento_publicos, experiencias, habilidades, historial_estado_actividades, historial_estado_presupuestos, historial_estado_proyectos, historial_estado_usuarios, horario_disponibles, informe_gastos, necesidades, notas, notificacion_emailes, notificaciones, notificacion_predeterminadas, notificacion_sistemas, objetivo_especificos, objetivo_generales, organizacion_externas, postulaciones, presupuestos, proyectos, reportes_generados, reportes, requisitos, restricciones, tipo_actividades, tipo_habilidades, tipo_notificaciones, tipo_proyectos, voluntarios.
					end
				end
			end
		end
	end
end

