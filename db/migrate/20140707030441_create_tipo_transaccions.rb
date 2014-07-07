class CreateTipoTransaccions < ActiveRecord::Migration
  def change
    create_table :tipo_transaccions do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
