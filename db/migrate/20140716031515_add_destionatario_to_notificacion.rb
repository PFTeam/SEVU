class AddDestionatarioToNotificacion < ActiveRecord::Migration
  def change
    add_column :notificaciones, :destinatario, :string
  end
end
