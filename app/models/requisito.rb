class Requisito < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :habilidad


  validates :actividad, :presence => true
  validates :habilidad, :presence => true
end
