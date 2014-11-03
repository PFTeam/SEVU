class Postulacion < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :usuario

  def aceptar
	  self.save if self.aceptado = true
  end

  def fue_aceptado

     if self.aceptado == true
	     "Si"
     else
	     "No"
     end
  	
  end
end
