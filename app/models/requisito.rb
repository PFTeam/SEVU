class Requisito < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :habilidad

  validates :actividad, :presence => true
  validates :habilidad, :presence => true

  def unico
	  if Requisito.all.where(actividad: self.actividad, habilidad: self.habilidad).count == 0
		  true
	  else
		  false
	  end
  end
end
