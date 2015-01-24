atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @guests.each do |item|
    next if item.updated_at.blank?

    feed.entry( item, :url => codex_url(:id => item.slug) ) do |entry|
      entry.title "CoVis Codex - #{item.full_name}"
      entry.enclosure :url => item.audio.url, :length => item.audio.size, :type => 'audio/mpeg'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name entry.author_name
      end
    end
  end
end