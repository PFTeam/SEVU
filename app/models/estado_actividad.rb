class EstadoActividad < ActiveRecord::Base

  has_many :historial_estado_actividades
  has_many :actividades, :through => :historial_estado_actividades

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }



  def self.estados_posibles estado_actual
    if estado_actual.nombre == 'Creada'
      estadosPosibles = [EstadoProyecto.find_by(nombre: 'Ejecutada'), EstadoProyecto.find_by(nombre: 'Planificada'), estado_actual]
    elsif estado_actual.nombre == 'Ejecutada'
      estadosPosibles = [EstadoProyecto.find_by(nombre: 'Terminado'), estado_actual]
    elsif estado_actual.nombre == 'Planificada'
      estadosPosibles = [EstadoProyecto.find_by(nombre: 'Ejecutada'), estado_actual]
    elsif estado_actual.nombre == 'Terminada'
      estadosPosibles = [estado_actual]
    else
      estadosPosibles = [estado_actual]
    end
  end
end
