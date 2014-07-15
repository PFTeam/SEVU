class AsignacionRol < ActiveRecord::Base
  belongs_to :rol
  belongs_to :proyecto
  belongs_to :usuario
end
