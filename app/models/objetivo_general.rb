class ObjetivoGeneral < ActiveRecord::Base
  belongs_to :proyecto
  #attr_accessible :titulo, :descripcion, :proyecto_id

  has_many :objetivo_especificos


  def self.asociados proy
     ObjetivoGeneral.where('proyecto_id =?', proy)
  end
end
