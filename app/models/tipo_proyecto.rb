class TipoProyecto < ActiveRecord::Base

  has_many :proyectos
  has_many :restricciones

  def to_s
    nombre
  end

end
