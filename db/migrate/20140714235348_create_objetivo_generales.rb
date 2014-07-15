class CreateObjetivoGenerales < ActiveRecord::Migration
  def change
    create_table :objetivo_generales do |t|
      t.string :titulo
      t.text :description
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
