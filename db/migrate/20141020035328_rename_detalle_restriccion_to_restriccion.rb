class RenameDetalleRestriccionToRestriccion < ActiveRecord::Migration
  def change
    rename_table :detalle_restricciones, :restricciones
  end
end
