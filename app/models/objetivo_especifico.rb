class ObjetivoEspecifico < ActiveRecord::Base
  belongs_to :objetivo_general

  #attr_accessible :titulo, :descripcion, :objetivo_general_id

  has_many :actividades

end
