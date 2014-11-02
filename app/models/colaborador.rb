class Colaborador < ActiveRecord::Base
  belongs_to :organizacion_externa
  belongs_to :proyecto

  validates :organizacion_externa, :presence => true
  validates :proyecto, :presence => true


  def unico
	  if Colaborador.all.where(organizacion_externa: self.organizacion_externa, proyecto: self.proyecto).count == 0
		  true
	  else
		  false
	  end
  end
end
