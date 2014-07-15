class Privilegio < ActiveRecord::Base
  belongs_to :tipo_privilegio

  has_many :asignacion_rol_predefinidos
  has_many :roles, :through => :asignacion_rol_predefinidos

end
