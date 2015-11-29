class AddActiveToObjetivoEspecificos < ActiveRecord::Migration
  def change
    add_column :objetivo_especificos, :active, :boolean
  end
end
