class CreateColaboradores < ActiveRecord::Migration
  def change
    create_table :colaboradores do |t|
      t.references :organizacion_externa, index: true
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
