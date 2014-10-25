class RemoveFechaNotificacionFromNotificacionSistemas < ActiveRecord::Migration
  def change
    remove_column :notificaciones, :fechaNotificacion, :datetime
  end
end
