class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.string :nombre
      t.text :descripcion
      t.int :duracion
      t.int :duracionReal
      t.date :fechaEstimadaInicio
      t.date :fechaRealInicio
      t.string :estrategiasIntervencion
      t.text :metodologiasIntervencion
      t.text :mecanismoEvaluacion
      t.text :resultadosEsperados
      t.references :objetivo_especifico, index: true
      t.references :proyecto, index: true
      t.references :tipo_actividad, index: true

      t.timestamps
    end
  end
end
