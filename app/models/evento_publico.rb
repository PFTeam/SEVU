class EventoPublico < ActiveRecord::Base
  belongs_to :usuario

  has_many :notificaciones
  has_many :asistencia_eventos


  validates :nombre, :presence => true
  validates :descripcion, :presence => true
  validates :fechaRealizacion, :presence => true
                               

  def to_s
	 nombre 
  	
  end

end
