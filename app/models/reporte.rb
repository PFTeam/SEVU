class Reporte < ActiveRecord::Base
  belongs_to :asignacion_actividad


  validates :descripcion, :length => { :maximum => 250 }
  def to_a
        [self]
  end

end
