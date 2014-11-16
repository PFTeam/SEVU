class AddUsuarioCreadorToNotificaciones < ActiveRecord::Migration
  def change
    add_reference :notificaciones, :usuario_creador, index: true
  end
end
