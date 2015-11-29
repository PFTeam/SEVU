class ObjetivoGeneral < ActiveRecord::Base
  belongs_to :proyecto

  has_many :objetivo_especificos, :dependent => :destroy

  validates :titulo, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }



  def self.asociados proy
     ObjetivoGeneral.where('proyecto_id =?', proy)
  end
  def borrable
  	count = 0
  	self.objetivo_especificos.each do |objetivo|
  		return false if not objetivo.borrable 
  	end
  	true
  end
end
