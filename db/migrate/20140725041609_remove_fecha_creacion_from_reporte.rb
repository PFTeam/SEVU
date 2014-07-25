class RemoveFechaCreacionFromReporte < ActiveRecord::Migration
  def change
    remove_column :reportes, :fechaCreacion, :datatime
  end
end
