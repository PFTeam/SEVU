class Habilidad < ActiveRecord::Base
  belongs_to :tipo_habilidad

  has_many :requisitos
  has_many :actividades, :through => :requisitos

  has_many :experiencias
  has_many :voluntarios, :through => :experiencias

end
