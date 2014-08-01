class EstadoProyecto < ActiveRecord::Base

  has_many :historial_estado_proyectos
  has_many :proyectos, :through => :historial_estado_proyectos


  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, presence => true, :length => { :maximum => 250 }


  def to_s
    nombre
  end

end
