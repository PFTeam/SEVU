class AsignacionRol < ActiveRecord::Base
  belongs_to :rol
  belongs_to :proyecto
  belongs_to :usuario

  def actual
     if self.esActual == true
	     "Si"
     else
	     "No"
     end
  end

end
