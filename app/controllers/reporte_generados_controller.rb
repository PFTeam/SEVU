class ReporteGeneradosController < ApplicationController
	def reporte_new
		authorize! :reporte_new, ReporteGenerado
  end
	
	def reporte_voluntarios
		authorize! :reporte_voluntarios, ReporteGenerado
		@voluntarios=Usuario.where("type = ?", 'Voluntario')
		if params[:usuario_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 1, :anio => params[:anio_rep], :u_ids => params[:usuario_ids], :i_ids => params[:item_ids] )
 		end 
  end	

  def reporte_proyectos
		authorize! :reporte_proyectos, ReporteGenerado
		if params[:proyecto_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 2, :anio => params[:anio_rep], :p_ids => params[:proyecto_ids], :i_ids => params[:item_ids] )
 		end 
  end

  def reporte_regionales
		authorize! :reporte_regionales, ReporteGenerado
		if params[:regional_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 3, :anio => params[:anio_rep], :r_ids => params[:regional_ids], :i_ids => params[:item_ids] )
 		end 
  end

  def reporte_generado
		authorize! :reporte_generado, ReporteGenerado	
		if params[:tipo_rep]== '1'	
			@name_voluntarios = []
			@users = Usuario.find(params[:u_ids])
			@users.each do |user| 
				@name_voluntarios << Usuario.find(user).nombreUsuario
			end
			params[:i_ids].each { |item|
				 case item
					 when '1' 
						@datos_voluntarios_suspendidos = []
						@datos_discretos_voluntarios_suspendidos = []
						@estado = EstadoUsuario.find_by(nombre:'Suspendido')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id = ? AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									user.id, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_voluntarios_suspendidos << @datos_grafico
								@datos_discretos_voluntarios_suspendidos <<	@datos_discretos
				 		end

						when '2'
						@datos_voluntarios_activos = []
						@datos_discretos_voluntarios_activos = []
						@estado = EstadoUsuario.find_by(nombre:'Activo')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id = ? AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									user.id, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_voluntarios_activos << @datos_grafico
								@datos_discretos_voluntarios_activos << @datos_discretos
				 		end

						when '3'
						@datos_discretos_act_creadas= []
						@datos_act_creadas= []
						@estado = EstadoActividad.find_by(nombre:'Creada')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								@acts = []
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@historiales =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND created_at BETWEEN ? AND ?  ",
									 @estado ,inicio,fin
								)
								@historiales.each do |hist|
									@acts << hist.actividad_id
								end
								actividades = AsignacionActividad.where(
									"actividad_id IN (?) AND usuario_id = ?",
									@acts, user
								)
								actividades = actividades.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), actividades.count]
								@datos_discretos << actividades.count			 
							end
								@datos_act_creadas << @datos_grafico
								@datos_discretos_act_creadas << @datos_discretos
				 		end

						when '4'
						@datos_discretos_act_plan= []
						@datos_act_plan= []
						@estado = EstadoActividad.find_by(nombre:'Planificada')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								@acts = []
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@historiales =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND created_at BETWEEN ? AND ?  ",
									 @estado ,inicio,fin
								)
								@historiales.each do |hist|
									@acts << hist.actividad_id
								end
								actividades = AsignacionActividad.where(
									"actividad_id IN (?) AND usuario_id = ?",
									@acts, user
								)
								actividades = actividades.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), actividades.count]
								@datos_discretos << actividades.count			 
							end
								@datos_act_plan << @datos_grafico
								@datos_discretos_act_plan <<	@datos_discretos
				 		end

						when '5'
						@datos_discretos_act_ejec= []
						@datos_act_ejec= []
						@estado = EstadoActividad.find_by(nombre:'Ejecutada')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								@acts = []
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@historiales =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND created_at BETWEEN ? AND ?  ",
									 @estado ,inicio,fin
								)
								@historiales.each do |hist|
									@acts << hist.actividad_id
								end
								actividades = AsignacionActividad.where(
									"actividad_id IN (?) AND usuario_id = ?",
									@acts, user
								)
								actividades = actividades.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), actividades.count]
								@datos_discretos << actividades.count			 
							end
								@datos_act_ejec << @datos_grafico
								@datos_discretos_act_ejec << @datos_discretos
				 		end

						when '6'
						@datos_discretos_act_term= []
						@datos_act_term= []
						@estado = EstadoActividad.find_by(nombre:'Terminada')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								@acts = []
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@historiales =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND created_at BETWEEN ? AND ?  ",
									 @estado ,inicio,fin
								)
								@historiales.each do |hist|
									@acts << hist.actividad_id
								end
								actividades = AsignacionActividad.where(
									"actividad_id IN (?) AND usuario_id = ?",
									@acts, user
								)
								actividades = actividades.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), actividades.count]
								@datos_discretos << actividades.count			 
							end
								@datos_act_term << @datos_grafico
								@datos_discretos_act_term << @datos_discretos
				 		end

						when '7'
						@datos_discretos_act_canc= []
						@datos_act_canc= []
						@estado = EstadoActividad.find_by(nombre:'Cancelada')
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								@acts = []
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@historiales =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND created_at BETWEEN ? AND ?  ",
									 @estado ,inicio,fin
								)
								@historiales.each do |hist|
									@acts << hist.actividad_id
								end
								actividades = AsignacionActividad.where(
									"actividad_id IN (?) AND usuario_id = ?",
									@acts, user
								)
								actividades = actividades.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), actividades.count]
								@datos_discretos << actividades.count			 
							end
								@datos_act_canc << @datos_grafico
								@datos_discretos_act_canc << @datos_discretos
				 		end

					 when '8'
						@datos_horas_voluntario = []
						@datos_discretos_voluntarios_horas = []
						@users.each do |user|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								horas =0
								@asignaciones= AsignacionActividad.where("usuario_id = ?   ", user)
								@asignaciones.each do |asig|
									@act = Actividad.find_by(id: asig.actividad_id)
									if @act.fechaRealInicio.between?(inicio,fin) && @act.duracionReal.present?
											horas += @act.duracionReal 
									end
								end
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), horas]
								@datos_discretos << horas
							end
							@datos_horas_voluntario << @datos_grafico
							@datos_discretos_voluntarios_horas << @datos_discretos
						end
				end
		}
		end

		if params[:tipo_rep]== '2'	
			@name_proyectos = []
			@proyect = Proyecto.find(params[:p_ids])
			@proyect.each do |proy| 
				@name_proyectos << Proyecto.find(proy).nombre
			end
			params[:i_ids].each { |item|
				 case item
					 when '1' 
						@datos_proyectos_creados = []
						@datos_discretos_proyectos_creados = []
						@estado = EstadoProyecto.find_by(nombre:'Creado')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id = ? AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									proy, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_proyectos_creados << @datos_grafico
								@datos_discretos_proyectos_creados << @datos_discretos
				 		end

						when '2' 
						@datos_proyectos_canc = []
						@datos_discretos_proyectos_canc = []
						@estado = EstadoProyecto.find_by(nombre:'Cancelado')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id = ? AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									proy, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_proyectos_canc << @datos_grafico
								@datos_discretos_proyectos_canc << @datos_discretos
				 		end

						when '3' 
						@datos_proyectos_ejec = []
						@datos_discretos_proyectos_ejec = []
						@estado = EstadoProyecto.find_by(nombre:'En Ejecución')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id = ? AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									proy, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_proyectos_ejec << @datos_grafico
								@datos_discretos_proyectos_ejec << @datos_discretos
				 		end

						when '4' 
						@datos_proyectos_term = []
						@datos_discretos_proyectos_term = []
						@estado = EstadoProyecto.find_by(nombre:'Terminado')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id = ? AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									proy, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_proyectos_term << @datos_grafico
								@datos_discretos_proyectos_term << @datos_discretos
				 		end

						when '5' 
						@datos_proyectos_susp = []
						@datos_discretos_proyectos_susp = []
						@estado = EstadoProyecto.find_by(nombre:'Suspendido')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id = ? AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									proy, @estado.id, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.present? ? 1 : 0]
								@datos_discretos << (historial_estados.present? ? 1 : 0)			 
							end
								@datos_proyectos_susp << @datos_grafico
								@datos_discretos_proyectos_susp << @datos_discretos
				 		end
					
						when '6'
						@datos_act_creadas = []
						@datos_discretos_act_creadas = []
						@estado = EstadoActividad.find_by(nombre:'Creada')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND actividad_id IN (?) AND created_at BETWEEN ? AND ?  ",
									@estado.id, @actividades, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_act_creadas << @datos_grafico
								@datos_discretos_act_creadas << @datos_discretos
				 		end

						when '7'
						@datos_act_plan = []
						@datos_discretos_act_plan = []
						@estado = EstadoActividad.find_by(nombre:'Planificada')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND actividad_id IN (?) AND created_at BETWEEN ? AND ?  ",
									@estado.id, @actividades, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_act_plan << @datos_grafico
								@datos_discretos_act_plan << @datos_discretos
				 		end

						when '8' 
						@datos_act_term = []
						@datos_discretos_act_term = []
						@estado = EstadoActividad.find_by(nombre:'Terminada')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND actividad_id IN (?) AND created_at BETWEEN ? AND ?  ",
									@estado.id, @actividades, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_act_term << @datos_grafico
								@datos_discretos_act_term << @datos_discretos
				 		end

						when '9' 
						@datos_act_canc = []
						@datos_discretos_act_canc = []
						@estado = EstadoActividad.find_by(nombre:'Cancelada')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								
								historial_estados =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND actividad_id IN (?) AND created_at BETWEEN ? AND ?  ",
									@estado.id, @actividades, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_act_canc << @datos_grafico
								@datos_discretos_act_canc << @datos_discretos
				 		end

						when '10' 
						@datos_act_ejec = []
						@datos_discretos_act_ejec = []
						@estado = EstadoActividad.find_by(nombre:'Ejecutada')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados =HistorialEstadoActividad.where(
									"estado_actividad_id = ? AND actividad_id IN (?) AND created_at BETWEEN ? AND ?  ",
									@estado.id, @actividades, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_act_ejec << @datos_grafico
								@datos_discretos_act_ejec << @datos_discretos 
				 		end
					
						when '11' 
						@datos_vol_susp = []
						@datos_discretos_vol_susp = []
						@estado = EstadoUsuario.find_by(nombre:'Suspendido')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@usuarios = []
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							 @asignaciones= AsignacionActividad.where("actividad_id IN (?) ", @actividades)
								@asignaciones.each do |asig|
									if (Usuario.find(asig.usuario_id).type == 'Voluntario')
									@usuarios << asig.usuario_id
									end
								end
								@usuarios = @usuarios.uniq
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id IN (?) AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									@usuarios, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_vol_susp << @datos_grafico
								@datos_discretos_vol_susp <<	@datos_discretos 
				 		end

						when '12' 
						@datos_vol_act = []
						@datos_discretos_vol_act = []
						@estado = EstadoUsuario.find_by(nombre:'Activo')
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@usuarios = []
							@acts= Actividad.where("proyecto_id = ?" , proy)
								@acts.each do |act|
									@actividades << act.id
								end
							 @asignaciones= AsignacionActividad.where("actividad_id IN (?) ", @actividades)
								@asignaciones.each do |asig|
									if (Usuario.find(asig.usuario_id).type == 'Voluntario')
									@usuarios << asig.usuario_id
									end
								end
								@usuarios = @usuarios.uniq
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id IN (?) AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									@usuarios, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_vol_act << @datos_grafico
								@datos_discretos_vol_act <<	@datos_discretos 
				 		end

						when '13'
						@datos_cant_pres_proy = []
						@datos_discretos_cant_pres_proy = []
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								pres =Presupuesto.find_by(
									"proyecto_id = ? AND aprobado = ? AND updated_at BETWEEN ? AND ? ", 
									 proy, true, inicio, fin
								)
								if pres == nil
									monto=0
								else
									monto = pres.montoTotal
								end
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), monto]
								@datos_discretos << monto			 
							end
								@datos_cant_pres_proy << @datos_grafico
								@datos_discretos_cant_pres_proy << @datos_discretos
				 		end

					when '14' 
						@datos_horas_proy = []
						@datos_discretos_horas_proy = []
						@proyect.each do |proy|
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								horas = 0
								@actividades =Actividad.where(
									"proyecto_id = ? AND updated_at BETWEEN ? AND ? ", 
									 proy, inicio, fin
								)
								@actividades.each do |act|
									if (act.duracionReal != nil)
										horas += act.duracionReal 
									end
								end
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), horas]
								@datos_discretos << horas			 
							end
								@datos_horas_proy << @datos_grafico
								@datos_discretos_horas_proy << @datos_discretos
				 		end

						when '15' 
						@datos_tipos = []
						@datos_discretos_tipos = []
						TipoActividad.all.each do |tipo|
							@datos_horas_act = []
							@datos_discretos_horas_act = []
							@proyect.each do |proy|
									@datos_grafico = []
									@datos_discretos = []
									(1..12).each do |mes|
										inicio = Time.new(params[:anio][:year], mes, 1)
										fin = Time.new(params[:anio][:year], mes, 31).end_of_day
										horas = 0
										@acts =Actividad.where(
											"proyecto_id = ? AND tipo_actividad_id = ? AND updated_at BETWEEN ? AND ? ", 
											 proy, tipo, inicio, fin
										)
										@acts.each do |act|
											if (act.duracionReal != nil)
												horas += act.duracionReal 
											end
									  end
										@datos_grafico << [Time.new(params[:anio][:year], mes, 15), horas]
										@datos_discretos << horas	
									end
									@datos_horas_act << @datos_grafico
									@datos_discretos_horas_act << @datos_discretos
					 		end
									@datos_tipos << @datos_horas_act
									@datos_discretos_tipos << @datos_discretos_horas_act
						end

					end
		}
		end
		
		if params[:tipo_rep]== '3'
			@name_regionales = []
			@regio = Regional.find(params[:r_ids])
			@regio.each do |reg| 
				@name_regionales << Regional.find(reg).nombre
			end
			params[:i_ids].each { |item|
				 case item
					 when '1' 
						@datos_proyectos_creados_reg = []
						@datos_discretos_proyectos_creados_reg = []
						@estado = EstadoProyecto.find_by(nombre:'Creado')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id IN (?) AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									@proys, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_proyectos_creados_reg << @datos_grafico
								@datos_discretos_proyectos_creados_reg << @datos_discretos
				 		end

						when '2'
						@datos_proyectos_canc_reg = []
						@datos_discretos_proyectos_canc_reg = []
						@estado = EstadoProyecto.find_by(nombre:'Cancelado')
						@regio.each do |reg|
							@datos_grafico = []
						  @datos_discretos = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id IN (?) AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									@proys, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_proyectos_canc_reg << @datos_grafico
								@datos_discretos_proyectos_canc_reg << @datos_discretos
				 		end


						when '3'
						@datos_proyectos_term_reg = []
						@datos_discretos_proyectos_term_reg = []
						@estado = EstadoProyecto.find_by(nombre:'Terminado')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id IN (?) AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									@proys, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_proyectos_term_reg << @datos_grafico
								@datos_discretos_proyectos_term_reg << @datos_discretos
				 		end


						when '4'
						@datos_proyectos_susp_reg = []
						@datos_discretos_proyectos_susp_reg = []
						@estado = EstadoProyecto.find_by(nombre:'Suspendido')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id IN (?) AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									@proys, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_proyectos_susp_reg << @datos_grafico
								@datos_discretos_proyectos_susp_reg << @datos_discretos
				 		end


						when '5'
						@datos_proyectos_ejec_reg = []
						@datos_discretos_proyectos_ejec_reg = []
						@estado = EstadoProyecto.find_by(nombre:'En Ejecución')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoProyecto.where(
									"proyecto_id IN (?) AND estado_proyecto_id = ? AND created_at BETWEEN ? AND ? ",
									@proys, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_proyectos_ejec_reg << @datos_grafico
								@datos_discretos_proyectos_ejec_reg << @datos_discretos
				 		end

						when '6' 
						@datos_vol_susp_reg = []
						@datos_discretos_vol_susp_reg = []
						@estado = EstadoUsuario.find_by(nombre:'Suspendido')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@usuarios = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							@acts= Actividad.where("proyecto_id IN (?)" , @proys)
								@acts.each do |act|
									@actividades << act.id
								end
							 @asignaciones= AsignacionActividad.where("actividad_id IN (?) ", @actividades)
								@asignaciones.each do |asig|
									if (Usuario.find(asig.usuario_id).type == 'Voluntario')
									@usuarios << asig.usuario_id
									end
								end
								@usuarios = @usuarios.uniq
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id IN (?) AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									@usuarios, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_vol_susp_reg << @datos_grafico
								@datos_discretos_vol_susp_reg <<	@datos_discretos 
				 		end

						when '7' 
						@datos_vol_act_reg = []
						@datos_discretos_vol_act_reg = []
						@estado = EstadoUsuario.find_by(nombre:'Activo')
						@regio.each do |reg|
							@datos_grafico = []
							@datos_discretos = []
							@actividades =[]
							@usuarios = []
							@proys= [] 
							@proyectos=Proyecto.where("regional_id = ? ", reg)
								@proyectos.each do |proy|
									@proys << proy.id
								end
							@acts= Actividad.where("proyecto_id IN (?)" , @proys)
								@acts.each do |act|
									@actividades << act.id
								end
							 @asignaciones= AsignacionActividad.where("actividad_id IN (?) ", @actividades)
								@asignaciones.each do |asig|
									if (Usuario.find(asig.usuario_id).type == 'Voluntario')
									@usuarios << asig.usuario_id
									end
								end
								@usuarios = @usuarios.uniq
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								historial_estados = HistorialEstadoUsuario.where(
									"usuario_id IN (?) AND estado_usuario_id = ? AND created_at BETWEEN ? AND ? ",
									@usuarios, @estado.id, inicio, fin
								)
								historial_estados = historial_estados.uniq
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), historial_estados.count]
								@datos_discretos << historial_estados.count			 
							end
								@datos_vol_act_reg << @datos_grafico
								@datos_discretos_vol_act_reg <<	@datos_discretos 
				 		end
				
						when '8'
						@datos_pres_reg = []
						@datos_discretos_pres_reg = []
						@regio.each do |reg|
							@proyec= []
							@proyectos = Proyecto.where("regional_id = ?", reg)
							@proyectos.each do |proy|
								@proyec << proy.id
							end
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								presupuestos =Presupuesto.where(
									"proyecto_id IN (?) AND aprobado = ? AND updated_at BETWEEN ? AND ? ", 
									 @proyec, true, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), presupuestos.count]
								@datos_discretos << presupuestos.count			 
							end
								@datos_pres_reg << @datos_grafico
								@datos_discretos_pres_reg << @datos_discretos
				 		end

						when '9'
						@datos_pres_eval_reg = []
						@datos_discretos_pres_eval_reg = []
						@regio.each do |reg|
							@proyec= []
							@proyectos = Proyecto.where("regional_id = ?", reg)
							@proyectos.each do |proy|
								@proyec << proy.id
							end
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								presupuestos =Presupuesto.where(
									"proyecto_id IN (?) AND evaluado = ? AND updated_at BETWEEN ? AND ? ", 
									 @proyec, false, inicio, fin
								)
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), presupuestos.count]
								@datos_discretos << presupuestos.count			 
							end
								@datos_pres_eval_reg << @datos_grafico
								@datos_discretos_pres_eval_reg << @datos_discretos
				 		end

						when '10'
						@datos_cant_pres_eval_reg = []
						@datos_discretos_cant_pres_eval_reg = []
						@regio.each do |reg|
							@proyec= []
							@proyectos = Proyecto.where("regional_id = ?", reg)
							@proyectos.each do |proy|
								@proyec << proy.id
							end
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								monto=0
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								@presupuestos =Presupuesto.where(
									"proyecto_id IN (?) AND aprobado = ? AND updated_at BETWEEN ? AND ? ", 
									 @proyec, true, inicio, fin
								)
								@presupuestos.each do |pres|
									monto += pres.montoTotal
								end
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), monto]
								@datos_discretos << monto			 
							end
								@datos_cant_pres_eval_reg << @datos_grafico
								@datos_discretos_cant_pres_eval_reg << @datos_discretos
				 		end
									
						when '11'
						@datos_horas_reg = []
						@datos_discretos_horas_reg = []
						@regio.each do |reg|
							@proyec= []
							@proyectos = Proyecto.where("regional_id = ?", reg)
							@proyectos.each do |proy|
								@proyec << proy.id
							end
							@datos_grafico = []
							@datos_discretos = []
							(1..12).each do |mes|
								inicio = Time.new(params[:anio][:year], mes, 1)
								fin = Time.new(params[:anio][:year], mes, 31).end_of_day
								horas = 0
								@actividades =Actividad.where(
									"proyecto_id IN (?) AND updated_at BETWEEN ? AND ? ", 
									 @proyec, inicio, fin
								)
								@actividades.each do |act|
									if (act.duracionReal != nil)
										horas += act.duracionReal 
									end
								end
								@datos_grafico << [Time.new(params[:anio][:year], mes, 15), horas]
								@datos_discretos << horas			 
							end
								@datos_horas_reg << @datos_grafico
								@datos_discretos_horas_reg << @datos_discretos
				 		end

						when '12'
						@datos_tipos = []
						@datos_discretos_tipos = []
						TipoActividad.all.each do |tipo|
							@datos_horas_act = []
							@datos_discretos_horas_act = []
							@regio.each do |reg|
									@proyec= []
									@proyectos = Proyecto.where("regional_id = ?",reg)
									@proyectos.each do |proy|
										@proyec << proy.id
									end
									@datos_grafico = []
									@datos_discretos = []
									(1..12).each do |mes|
										inicio = Time.new(params[:anio][:year], mes, 1)
										fin = Time.new(params[:anio][:year], mes, 31).end_of_day
										horas = 0
										@acts =Actividad.where(
											"proyecto_id IN (?) AND tipo_actividad_id = ? AND updated_at BETWEEN ? AND ? ", 
											 @proyec, tipo, inicio, fin
										)
										@acts.each do |act|
											if (act.duracionReal != nil)
												horas += act.duracionReal 
											end
									  end
										@datos_grafico << [Time.new(params[:anio][:year], mes, 15), horas]
										@datos_discretos << horas	
									end
									@datos_horas_act << @datos_grafico
									@datos_discretos_horas_act << @datos_discretos
					 		end
									@datos_tipos << @datos_horas_act
									@datos_discretos_tipos << @datos_discretos_horas_act
						end

		end
		}
		end

  end
end
