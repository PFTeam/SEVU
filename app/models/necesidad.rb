class Necesidad < ActiveRecord::Base
  belongs_to :usuario
  has_one :proyecto

  validates :titulo, :uniqueness => { :message => 'No pueden existir dos necesidades con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true
  validates :ambitoAplicacion, :presence => true
  validates :usuario, :presence => true
  
  def to_s
    titulo
  end
end
