xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "CoVis Codex"
    xml.description "We interview movers and shakers and find out who they really are."
    xml.link 'http://covisco.com/codex'

    for article in @guests
      xml.item do
        xml.title "CoVis Codex - #{article.full_name}"
        xml.description "In this episode we interview #{article.full_name}!"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.enclosure :url => article.audio.url, :length => article.audio.size, :type => 'audio/mpeg'
        xml.link codex_url(article)
        xml.guid codex_url(article)
      end
    end
  end
end