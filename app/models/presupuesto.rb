class Presupuesto < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :restriccion
  belongs_to :usuario
end
