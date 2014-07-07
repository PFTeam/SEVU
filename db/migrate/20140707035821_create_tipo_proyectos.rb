class CreateTipoProyectos < ActiveRecord::Migration
  def change
    create_table :tipo_proyectos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
