class CreateObjetivoEspecificos < ActiveRecord::Migration
  def change
    create_table :objetivo_especificos do |t|
      t.string :titulo
      t.text :descripcion
      t.references :objetivo_general, index: true

      t.timestamps
    end
  end
end
