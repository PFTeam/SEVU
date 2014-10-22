class DropRestriccion < ActiveRecord::Migration
  def change
    drop_table :restricciones
  end
end
