class AddDescriptionToCodexGuests < ActiveRecord::Migration
  def change
    add_column :codex_guests, :description, :string
  end
end
