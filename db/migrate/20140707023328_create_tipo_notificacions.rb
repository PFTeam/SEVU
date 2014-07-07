class CreateTipoNotificacions < ActiveRecord::Migration
  def change
    create_table :tipo_notificacions do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
