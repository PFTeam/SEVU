class TipoProyecto < ActiveRecord::Base

  has_many :proyectos
  has_many :restricciones

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Tipos con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }

  def to_s
    nombre
  end

end
