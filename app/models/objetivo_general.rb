class ObjetivoGeneral < ActiveRecord::Base
  belongs_to :proyecto

  has_many :objetivo_especificos

end
