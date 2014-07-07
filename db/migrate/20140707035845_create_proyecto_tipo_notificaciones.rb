class CreateProyectoTipoNotificaciones < ActiveRecord::Migration
  def change
    create_table :proyecto_tipo_notificaciones do |t|
      t.references :proyecto, index: true
      t.references :tipo_notificacion, index: true

      t.timestamps
    end
  end
end
