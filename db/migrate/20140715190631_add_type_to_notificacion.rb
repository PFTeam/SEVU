class AddTypeToNotificacion < ActiveRecord::Migration
  def change
    add_column :notificaciones, :type, :string
  end
end
