class AddAttachmentAudioToCodexGuests < ActiveRecord::Migration
  def self.up
    change_table :codex_guests do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :codex_guests, :audio
  end
end
