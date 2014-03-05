xml.rss 'xmlns:content' => "http://purl.org/rss/1.0/modules/content/", 'xmlns:wfw' => "http://wellformedweb.org/CommentAPI/", 'xmlns:dc' => "http://purl.org/dc/elements/1.1/", 'xmlns:atom' => "http://www.w3.org/2005/Atom", 'xmlns:sy' => "http://purl.org/rss/1.0/modules/syndication/", 'xmlns:slash' => "http://purl.org/rss/1.0/modules/slash/", 'xmlns:media' => "http://search.yahoo.com/mrss/", 'version' => "2.0" do
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
        xml.media :thumbnail, :url => p.thumbnail, :medium => 'image'
        xml.media :content, :url => p.thumbnail, :medium => 'image'
        xml.description :type => 'html' do xml.cdata!(p.rendered_description) end
        xml.content :type => 'html' do xml.cdata!(p.rendered_markdown) end
        p.tags.each do |t|
          xml.category t.name
        end
      end
    end
  end
end