class OrganizacionExternaProyecto < ActiveRecord::Base
  belongs_to :organizacion_externa
  belongs_to :proyecto
end
