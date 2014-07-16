class AddRemitenteToNotificacion < ActiveRecord::Migration
  def change
    add_column :notificaciones, :remitente, :string
  end
end
