class CreateTipoTransacciones < ActiveRecord::Migration
  def change
    create_table :tipo_transacciones do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
