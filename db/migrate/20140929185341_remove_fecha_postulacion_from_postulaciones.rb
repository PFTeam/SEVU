class RemoveFechaPostulacionFromPostulaciones < ActiveRecord::Migration
  def change
    remove_column :postulaciones, :fechaPostulacion, :datatime
  end
end
