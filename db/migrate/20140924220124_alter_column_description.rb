class AlterColumnDescription < ActiveRecord::Migration
  def change
    rename_column :objetivo_generales, :description, :descripcion 
  end
end
