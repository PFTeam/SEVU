class ActividadHabilidad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :habilidad
end
