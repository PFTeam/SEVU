class Necesidad < ActiveRecord::Base
  belongs_to :usuario

  def to_s
    titulo
  end
end
