class RemoveFechaCreacionFromNota < ActiveRecord::Migration
  def change
    remove_column :notas, :fechaCreacion, :datatime
  end
end
