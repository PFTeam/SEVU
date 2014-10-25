class AsignacionActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :usuario

  has_many :reportes

  def to_a
        [self]
  end
end
