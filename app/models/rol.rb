class Rol < ActiveRecord::Base
  belongs_to :tipo_rol

  has_many :asignacion_roles
  has_many :asignacion_rol_predefinidos
  has_many :asignacion_funciones

end
