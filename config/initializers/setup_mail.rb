require 'development_mail_interceptor'
ActionMailer::Base.smtp_settings = {
	  :address              => "smtp.gmail.com",
	    :port                 => 587,
	      :domain               => "gmail.com",
	      :user_name            => "argentina.sevu.soporte@gmail.com",
		  :password             => "sevu2015",
		    :authentication       => "plain",
		      :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
