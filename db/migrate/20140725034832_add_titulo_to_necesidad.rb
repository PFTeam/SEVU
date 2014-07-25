class AddTituloToNecesidad < ActiveRecord::Migration
  def change
    add_column :necesidades, :titulo, :string
  end
end
