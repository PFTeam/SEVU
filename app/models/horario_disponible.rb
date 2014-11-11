class HorarioDisponible < ActiveRecord::Base
  belongs_to :voluntario

  before_save :superpuesto, :horarios_acordes

  def horarios_acordes
  	if (horaDesde.strftime("%H:%M") > horaHasta.strftime("%H:%M")) then
  		errors.add :base, ' Los horarios no son coherentes.'
  		return false
  	end
  end

  def superpuesto
  	@horarios = HorarioDisponible.all.where(voluntario_id: voluntario_id, diaSemana: diaSemana)
  	if !@horarios.empty? then
  		@horarios.each do |horario|
  			puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  			puts horaDesde
  			puts horario.horaDesde
  			puts horario.horaHasta
  			if horaDesde.strftime("%H:%M").between?(horario.horaDesde.strftime("%H:%M"), horario.horaHasta.strftime("%H:%M")) || 
  				horaHasta.strftime("%H:%M").between?(horario.horaDesde.strftime("%H:%M"), horario.horaHasta.strftime("%H:%M")) then

  				errors.add :base, ' Existe superposicion de horarios'
  				return false
  			end
  		end
  	end
  end


end
