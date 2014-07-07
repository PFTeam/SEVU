class Actividad < ActiveRecord::Base
  belongs_to :objetivo_especifico
  belongs_to :proyecto
  belongs_to :tipo_actividad
end
