class Sesion < ActiveRecord::Base
  belongs_to :usuario

  has_many :transacciones

end
