class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.text :breveDescripcion
      t.date :fechaInicio
      t.date :fechaFin
      t.text :antecedentes
      t.text :justificacionProyecto
      t.int :cantidadBeneficiariosDirectos
      t.int :cantidadBeneficiariosIndirectos
      t.text :justificacionImpacto
      t.text :localizacionGeografica
      t.references :tipo_proyecto, index: true
      t.references :necesidad, index: true

      t.timestamps
    end
  end
end
