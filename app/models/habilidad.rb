class Habilidad < ActiveRecord::Base
  belongs_to :tipo_habilidad

  has_many :requisitos
  has_many :experiencias

end
