class AddDescripcionToEstadoUsuario < ActiveRecord::Migration
  def change
    add_column :estado_usuarios, :descripcion, :string
  end
end
