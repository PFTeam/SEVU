class AddRegionalToProyectos < ActiveRecord::Migration
  def change
    add_reference :proyectos, :regional, index: true
  end
end
