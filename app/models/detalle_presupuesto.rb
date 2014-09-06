class DetallePresupuesto < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :concepto_gasto
  
  validates_presence_of :monto, :titulo, :descripcion, message: "es un campo obligatorio"

  validates :monto,
      #:presence => true,
      :numericality => {
        :greater_than => 0,
        :message => "no puede ser negativo"}

#  validates_length_of :titulo,
#      :presence => true,
#      :maximum => 255,
#      :allow_blank => false

  validates :titulo,
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"}
      #:presence => true,
      #:allow_blank => false #, message: "no puede estar en blanco"

  #validates :descripcion,
      #:presence => true,
      #:allow_blank => false #, message: "no puede estar en blanco"

end
