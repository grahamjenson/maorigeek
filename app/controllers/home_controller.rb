class HomeController < ApplicationController

  def home
    @recent_posts = Post.recent
    @recent_gists = Gist.recent
  end

  def about
  end

  def contact
  end

  def contact_form_submit
    FormMailer.contact_form_mail(params).deliver
    flash[:notice] = 'Thank you for the message'
    redirect_to :contact
  end

  def portfolio
  end

  def portfolio_item
    @gist = Gist.find(params[:id])
    @related_items = @gist.find_related_tags.all
  end

  def blog
    @posts = Post.recent
    @popular_posts = @posts
    @latest_project = Gist.last
  end

  def post
    @post = Post.find_by_slug(params[:slug])
    @latest_project = Gist.last
    @related_posts = @post.find_related_tags.published
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)

    respond_to do |f|
      f.html {}
      f.rss { render layout: false}
      f.atom { render layout: false}
    end
    
  end

  def sitemap
    headers['Content-Type'] = 'application/xml'
    last_post = Post.recent.last
    if stale?(:etag => last_post, :last_modified => last_post.updated_at.utc)
      respond_to do |format|
        format.xml do
          @posts = Post.published
          @gists = Gist.all
        end
      end
    end    
  end

end
