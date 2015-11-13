class AddActiveToAsignacionRoles < ActiveRecord::Migration
  def change
    add_column :asignacion_roles, :active, :boolean
  end
end
