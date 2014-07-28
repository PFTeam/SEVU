class RemoveEsActualFromHistorialEstadoUsuario < ActiveRecord::Migration
  def change
    remove_column :historial_estado_usuarios, :esActual, :boolean
  end
end
