class AddDescripcionToEstadoProyecto < ActiveRecord::Migration
  def change
    add_column :estado_proyectos, :descripcion, :string
  end
end
