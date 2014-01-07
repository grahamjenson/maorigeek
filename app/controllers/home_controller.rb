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
    @related_gists = @gist.find_related_tags
  end

  def blog
    @recent_posts = Post.recent
  end

  def post
    @post = Post.find(params)
  end
end
