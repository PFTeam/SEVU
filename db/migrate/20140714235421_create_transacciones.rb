class CreateTransacciones < ActiveRecord::Migration
  def change
    create_table :transacciones do |t|
      t.text :descripcion
      t.datetime :fechaTransaccion
      t.references :proyecto, index: true
      t.references :tipo_transaccion, index: true
      t.references :sesion, index: true

      t.timestamps
    end
  end
end
