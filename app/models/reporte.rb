class Reporte < ActiveRecord::Base
  belongs_to :asignacion_actividad

  validates :descripcion, :length => { :maximum => 250 }, :presence => true
  def to_a
        [self]
  end

end
