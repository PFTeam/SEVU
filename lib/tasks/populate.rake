namespace :db do
  desc "Limpar y poblar la base de datos"
  task :populate => :environment do
    require "populator" 
    require 'faker'
    
    [Actividad, AsignacionActividad,AsignacionFuncion, AsignacionRolPredefinido, AsignacionRol,AsistenciaEvento,Colaborador,Comprobante, ConceptoGasto, DetalleGasto, DetallePresupuesto, DetalleRestriccion, EstadoActividad, EstadoPresupuesto, EstadoProyecto, EstadoUsuario, EventoPublico, Experiencia, Habilidad, HistorialEstadoActividad, HistorialEstadoPresupuesto, HistorialEstadoProyecto, HistorialEstadoUsuario, HorarioDisponible, InformeGasto, Necesidad, Nota, NotificacionEmail, NotificacionPredeterminada, Notificacion, NotificacionSistema, ObjetivoEspecifico, ObjetivoGeneral, OrganizacionExterna, Postulacion, Presupuesto, Privilegio, Proyecto, Reporte, Requisito, Restriccion, Rol, Sesion, TipoActividad, TipoHabilidad, TipoNotificacion, TipoPrivilegio, TipoProyecto, TipoRol, TipoTransaccion, Transaccion, Usuario, Voluntario].each(&:delete_all)
   
    EstadoProyecto.populate 1 do |estado|
      estado.nombre= "Creado"
      estado.descripcion= "El proyecto se encuentra en estado creado" 
    end 
    EstadoProyecto.populate 1 do |estado|
      estado.nombre= "En Ejecución"
      estado.descripcion= "El proyecto se encuentra actualmente en ejecución" 
    end 
    EstadoProyecto.populate 1 do |estado|
      estado.nombre= "Suspendido"
      estado.descripcion= "El proyecto se encuentra momentaneamente suspendido" 
    end 
    EstadoProyecto.populate 1 do |estado|
      estado.nombre= "Cancelado"
      estado.descripcion= "El proyecto se encuentra definitivamente cancelado" 
    end 
    EstadoProyecto.populate 1 do |estado|
      estado.nombre= "Terminado"
      estado.descripcion= "El proyecto ha terminado" 
    end 

    EstadoActividad.populate 1 do |estado|
      estado.nombre= "Creada"
      estado.descripcion= "La actividad se encuentra en estado creada"
    end
    EstadoActividad.populate 1 do |estado|
      estado.nombre= "Planificada"
      estado.descripcion= "La actividad se encuentra planificada"
    end
    EstadoActividad.populate 1 do |estado|
      estado.nombre= "Ejecutada"
      estado.descripcion= "La actividad se encuentra actualmente en ejecución"
    end
    EstadoActividad.populate 1 do |estado|
      estado.nombre= "Terminada"
      estado.descripcion= "La actividad ha terminado"
    end

    Proyecto.populate 1 do |proyecto|
      proyecto.nombre = "Creación de un sistema confiable Autos"
      proyecto.breveDescripcion = "Se desarrollará un sistema para poder administrar un auto sin errores y poder dirigirlo de manera autónoma"
      proyecto.fechaInicio = 1.month.ago..Time.now 
      proyecto.fechaFin = 1.year.from_now
      proyecto.antecedentes = "Ninguno"
      proyecto.justificacionProyecto = "Se desea avanzar en el campo de la automatición en cuanto al tema vehicular"
      proyecto.cantidadBeneficiariosDirectos = 100
      proyecto.cantidadBeneficiariosIndirectos = 200
      proyecto.justificacionImpacto = "Se está realizando en conjunto con un grupo de la UNC el cual permitirá la divulgación del proyecto y por ende su impacto"
      proyecto.localizacionGeografica = "Mendoza"
      TipoProyecto.populate 1 do |tipoProyecto|
	 tipoProyecto.nombre = "Voluntariado"
	 tipoProyecto.descripcion = "Proyecto sin remuneración económica"
      end
      Necesidad.populate 1 do |necesidad|
         necesidad.descripcion = "Queremos comenzar con la investigación en el manejo de autos junto con la UNC"
	 necesidad.ambitoAplicacion = "Automotriz y automatización"
#	 Usuario.populate 1 do |usuario|
 #           usuario.nombreUsuario = Faker::Internet.user_name 
#	    usuario.apellidoNombre = Faker::Name.name 
#	    usuario.email = Faker::Internet.email 
#	    usuario.direccion = Faker::Address.street_address
#	    usuario fechaRegistro = 1.week.ago..Time.now
#	    usuario.telefono = Faker::PhoneNumber.cell_phone
#	    usuario.fax = Faker::PhoneNumber.phone_number
#	    necesidad.usuario_id = usuario.id
#	 end
	 necesidad.titulo = "Sistema de manejo de auto confiable"
      end
      










  end
end
end
