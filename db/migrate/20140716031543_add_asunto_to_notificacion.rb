class AddAsuntoToNotificacion < ActiveRecord::Migration
  def change
    add_column :notificaciones, :asunto, :string
  end
end
