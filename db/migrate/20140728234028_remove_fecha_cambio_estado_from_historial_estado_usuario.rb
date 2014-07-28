class RemoveFechaCambioEstadoFromHistorialEstadoUsuario < ActiveRecord::Migration
  def change
    remove_column :historial_estado_usuarios, :fechaCambioEstado, :datetime
  end
end
