class Transaccion < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :sesion
end
