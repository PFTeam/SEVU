class CreateSesiones < ActiveRecord::Migration
  def change
    create_table :sesiones do |t|
      t.datetime :fechaInicio
      t.datetime :fechaFin
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
