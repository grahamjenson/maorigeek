xml.instruct! :xml, version: "1.0" 
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Maori Geek Blog"
    xml.description "Maori Geek Blog"
    xml.link blog_url

    @posts.each do |p|
      xml.item do
        xml.title p.title
        xml.description p.title
        xml.pubDate p.published_at.to_s(:rfc822)
        xml.link  post_url(p.slug)
        xml.guid post_url(p.slug)
      end
    end
  end
end