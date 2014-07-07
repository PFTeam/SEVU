class CreateSesions < ActiveRecord::Migration
  def change
    create_table :sesions do |t|
      t.date :fechaInicio
      t.date :fechaFin
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
