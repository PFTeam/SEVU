class Transaccion < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :tipo_transaccion
  belongs_to :sesion
end
