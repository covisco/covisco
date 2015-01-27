class AddShowNotesToCodexGuests < ActiveRecord::Migration
  def change
    add_column :codex_guests, :show_notes, :text
  end
end
