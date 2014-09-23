class FixColumnApellidoNombre < ActiveRecord::Migration
  def change
    rename_column :usuarios, :apellidoNombre, :apellido_nombre
  end
end
