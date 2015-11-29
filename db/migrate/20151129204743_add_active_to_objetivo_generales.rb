class AddActiveToObjetivoGenerales < ActiveRecord::Migration
  def change
    add_column :objetivo_generales, :active, :boolean
  end
end
