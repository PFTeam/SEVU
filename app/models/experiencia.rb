class Experiencia < ActiveRecord::Base
  belongs_to :habilidad
  belongs_to :voluntario
end
