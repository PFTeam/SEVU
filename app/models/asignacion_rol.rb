class AsignacionRol < ActiveRecord::Base
  belongs_to :rol
  belongs_to :proyecto
  belongs_to :usuario


  validates :rol , :presence => true
  validates :usuario , :presence => true

  def actual
     if self.esActual == true
	     "Si"
     else
	     "No"
     end
  end



end
