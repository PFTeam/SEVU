class NotificacionMailer < ActionMailer::Base
	default from: "argentina.sevu.soporte@gmail.com"

	def enviar_notificacion(notificacion)
		@notificacion = notificacion
		mail(:to => "#{notificacion.usuario_destino.apellido_nombre} <#{notificacion.usuario_destino.email}>", :subject => "Notificación S.E.V.U")
	end
end
