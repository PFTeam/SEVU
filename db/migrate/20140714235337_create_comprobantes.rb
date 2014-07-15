class CreateComprobantes < ActiveRecord::Migration
  def change
    create_table :comprobantes do |t|
      t.integer :numero

      t.timestamps
    end
  end
end
