class AsignacionFuncion < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :rol
end
