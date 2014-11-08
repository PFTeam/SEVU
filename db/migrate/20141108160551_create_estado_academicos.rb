class CreateEstadoAcademicos < ActiveRecord::Migration
  def change
    create_table :estado_academicos do |t|
      t.integer :cantidad_materias_regulares
      t.integer :cantidad_materias_aprobadas
      t.integer :cantidad_materias_cursando
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
