class RemoveHoraNotificacionFromNotificacionSistemas < ActiveRecord::Migration
  def change
    remove_column :notificaciones, :horaNotificacion, :datetime
  end
end
