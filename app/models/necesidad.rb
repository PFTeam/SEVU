class Necesidad < ActiveRecord::Base
  belongs_to :usuario
  has_one :proyecto

  def to_s
    titulo
  end
end
