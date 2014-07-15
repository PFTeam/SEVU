class ObjetivoEspecifico < ActiveRecord::Base
  belongs_to :objetivo_general

  has_many :actividades

end
