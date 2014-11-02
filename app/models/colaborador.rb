class Colaborador < ActiveRecord::Base
  belongs_to :organizacion_externa
  belongs_to :proyecto

  validates :organizacion_externa, :presence => true
  validates :proyecto, :presence => true
end
