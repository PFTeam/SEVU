class AsignacionRolPredefinido < ActiveRecord::Base
  belongs_to :privilegio
  belongs_to :rol
end
