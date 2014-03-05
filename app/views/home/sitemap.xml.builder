xml.instruct! :xml, version: "1.0" 
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @posts.each do |post|
    xml.url do
      xml.loc post_url(post.slug)
      xml.lastmod post.updated_at.to_s(:rfc822)
      xml.changefreq 'weekly'
      xml.priority 0.75
    end
  end

  @gists.each do |gist|
    xml.url do
      xml.loc portfolio_item_url(gist)
      xml.lastmod gist.updated_at.strftime('%Y-%m-%d')
      xml.changefreq 'weekly'
      xml.priority 0.5
    end
  end
end
