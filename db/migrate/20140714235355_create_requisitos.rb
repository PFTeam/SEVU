class CreateRequisitos < ActiveRecord::Migration
  def change
    create_table :requisitos do |t|
      t.references :actividad, index: true
      t.references :habilidad, index: true

      t.timestamps
    end
  end
end
