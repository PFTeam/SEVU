class Rol < ActiveRecord::Base
  belongs_to :tipo_rol

  has_many :asignacion_roles

  has_many :asignacion_rol_predefinidos
  has_many :privilegios, :through => :asignacion_rol_predefinidos

  has_many :asignacion_funciones
  has_many :usuarios, :through => :asignacion_funciones

  def to_s
    nombre
  end
	
	validates :nombre, :descripcion, :tipo_rol_id, :presence => { message: "(no puede dejarse vacío)" }

end
