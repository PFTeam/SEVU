class DevelopmentMailInterceptor
	  def self.delivering_email(mensaje)
	      mensaje.subject = "#{mensaje.to} #{mensaje.subject}"
	      mensaje.to = "argentina.sevu.soporte@gmail.com"
	  end
end
