class ObjetivoEspecifico < ActiveRecord::Base
  belongs_to :objetivo_general

  has_many :actividades, :dependent => :destroy

  validates :titulo, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }

  def to_s
	  titulo
  end
end
