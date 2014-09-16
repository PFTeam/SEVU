class AddAttachmentFotoToUsuarios < ActiveRecord::Migration
  def self.up
    change_table :usuarios do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :usuarios, :foto
  end
end
