class CreateTipoActividads < ActiveRecord::Migration
  def change
    create_table :tipo_actividads do |t|
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
