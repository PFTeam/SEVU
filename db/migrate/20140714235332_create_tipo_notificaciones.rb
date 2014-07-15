class CreateTipoNotificaciones < ActiveRecord::Migration
  def change
    create_table :tipo_notificaciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
