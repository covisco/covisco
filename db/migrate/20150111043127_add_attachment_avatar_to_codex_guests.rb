class AddAttachmentAvatarToCodexGuests < ActiveRecord::Migration
  def self.up
    change_table :codex_guests do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :codex_guests, :avatar
  end
end
