class HomeController < ApplicationController

  def home
    @recent_posts = Post.recent
  end

  def about
  end

  def contact
  end

  def portfolio
  end

  def blog
    @recent_posts = Post.recent
  end

  def post
    @post = Post.find(params)
  end
end
