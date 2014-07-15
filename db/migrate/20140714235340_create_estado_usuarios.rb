class CreateEstadoUsuarios < ActiveRecord::Migration
  def change
    create_table :estado_usuarios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
