class CreateRestricciones < ActiveRecord::Migration
  def change
    create_table :restricciones do |t|
      t.datetime :fechaDesde
      t.datetime :fechaHasta
      t.boolean :esActiva
      t.references :tipo_proyecto, index: true

      t.timestamps
    end
  end
end
