class ObjetivoGeneral < ActiveRecord::Base
  belongs_to :proyecto

  has_many :objetivo_especificos

  validates :titulo, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }



  def self.asociados proy
     ObjetivoGeneral.where('proyecto_id =?', proy)
  end
end
