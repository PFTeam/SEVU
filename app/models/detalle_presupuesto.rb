class DetallePresupuesto < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :concepto_gasto
  
  validates_presence_of :monto, :titulo, :descripcion, message: "es un campo obligatorio"
  
#  validate :cumple_restricciones

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

 # def cumple_restricciones
 #   @presupuesto = Presupuesto.where id: :presupuesto_id
 #   @proyecto = Proyecto.where :id => @presupuesto.proyectos
 #   @tipo_proyecto = TipoProyecto.where id: @proyecto.tipo_proyecto_id
 #   @restriccion = Restriccion.where tipo_proyecto_id: @proyecto.tipo_proyecto_id
 #   @detalle_restriccion = DetalleRestriccion.where(restriccion_id: @restriccion.id)
##    if @detalle_restriccion.montoMax < :monto then
 #     errors.add :base, 'El detalle del Presupuesto supera las restricciones' unless (@detalle_restriccion.montoMax >= :monto)
 #    #end
 # end

end
