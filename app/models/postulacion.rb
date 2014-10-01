class Postulacion < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :usuario

  def aceptar
	  self.save if self.aceptado = true
  end
end
