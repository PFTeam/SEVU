class AsignacionActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :usuario

  has_many :reportes

end
