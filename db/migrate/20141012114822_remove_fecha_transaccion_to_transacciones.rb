class RemoveFechaTransaccionToTransacciones < ActiveRecord::Migration
  def change
    remove_column :transacciones, :fechaTransaccion, :datetime
  end
end
