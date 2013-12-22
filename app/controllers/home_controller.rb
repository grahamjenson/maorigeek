class HomeController < ApplicationController

  def home
    @recent_posts = Post.recent
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

  def blog
    @recent_posts = Post.recent
  end

  def post
    @post = Post.find(params)
  end
end
