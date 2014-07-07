class CreateEstadoProyectos < ActiveRecord::Migration
  def change
    create_table :estado_proyectos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
