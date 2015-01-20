class AddSlugToCodexGuests < ActiveRecord::Migration
  def change
    add_column :codex_guests, :slug, :string
  end
end
