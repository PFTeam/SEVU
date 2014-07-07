class CreateRestriccions < ActiveRecord::Migration
  def change
    create_table :restriccions do |t|
      t.date :fechaDesde
      t.date :fechaHasta
      t.boolean :esActiva
      t.references :tipo_proyecto, index: true

      t.timestamps
    end
  end
end
