class AsistenciaEventoPublico < ActiveRecord::Base
  belongs_to :evento_publico
  belongs_to :usuario
end