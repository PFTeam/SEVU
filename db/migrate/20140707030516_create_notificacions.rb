class CreateNotificacions < ActiveRecord::Migration
  def change
    create_table :notificacions do |t|
      t.date :fechaNotificacion
      t.date :horaNotificacion
      t.boolean :esActiva
      t.text :mensaje
      t.boolean :notificado
      t.references :usuarioCreador, index: true
      t.references :usuarioDestino, index: true
      t.references :evento_publico, index: true
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
