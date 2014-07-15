class CreateNotificacionPredeterminadas < ActiveRecord::Migration
  def change
    create_table :notificacion_predeterminadas do |t|
      t.references :proyecto, index: true
      t.references :tipo_notificacion, index: true

      t.timestamps
    end
  end
end
