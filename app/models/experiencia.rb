class Experiencia < ActiveRecord::Base
  belongs_to :habilidad
  belongs_to :voluntario
  def to_a
        [self]
  end
end
