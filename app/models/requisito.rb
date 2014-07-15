class Requisito < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :habilidad
end
