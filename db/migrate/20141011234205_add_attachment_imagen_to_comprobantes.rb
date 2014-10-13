class AddAttachmentImagenToComprobantes < ActiveRecord::Migration
  def self.up
    change_table :comprobantes do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :comprobantes, :imagen
  end
end
