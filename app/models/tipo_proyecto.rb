class TipoProyecto < ActiveRecord::Base

  has_many :proyectos
  has_many :restricciones

end
