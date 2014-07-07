class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transaccions do |t|
      t.text :descripcion
      t.date :fechaTransaccion
      t.references :proyecto, index: true
      t.references :tipo_transaccion, index: true
      t.references :sesion, index: true

      t.timestamps
    end
  end
end
