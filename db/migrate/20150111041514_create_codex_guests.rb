class CreateCodexGuests < ActiveRecord::Migration
  def change
    create_table :codex_guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :twitter
      t.string :facebook
      t.string :linkedin
      t.string :website
      t.string :link_video
      t.string :link_audio
      t.string :photo
      t.datetime :date_uploaded

      t.timestamps
    end
  end
end
