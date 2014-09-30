class ObjetivoGeneral < ActiveRecord::Base
  belongs_to :proyecto

  has_many :objetivo_especificos


  def self.asociados proy
     ObjetivoGeneral.where('proyecto_id =?', proy)
  end
end
