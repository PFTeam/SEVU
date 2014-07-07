class CreateOrganizacionExternaProyectos < ActiveRecord::Migration
  def change
    create_table :organizacion_externa_proyectos do |t|
      t.references :organizacion_externa, index: true
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
