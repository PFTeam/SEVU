class AddUsuarioDestinoToNotificaciones < ActiveRecord::Migration
  def change
    add_reference :notificaciones, :usuario_destino, index: true
  end
end
