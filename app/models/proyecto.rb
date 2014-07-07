class Proyecto < ActiveRecord::Base
  belongs_to :tipo_proyecto
  belongs_to :necesidad
end
