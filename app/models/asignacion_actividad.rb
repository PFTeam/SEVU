class AsignacionActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :usuario
end
