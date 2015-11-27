class HistorialEstadoActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :estado_actividad

  validates :actividad, :presence => false
  validates :estado_actividad, :presence => false 

  def usuarios_actividad
  	@usuarios = []
  	self.actividad.asignacion_actividades.each do |asignacion|
  		if asignacion.vigente == true
        	@usuarios = @usuarios + asignacion.usuario.to_a
        end
    end
    return @usuarios
  end

end
