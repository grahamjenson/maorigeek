class PeopleController < ApplicationController

  def create
      p = Person.new
      p.email = params[:email]
      if p.save
        flash[:notice] = 'Thankyou for subscribing, an email to confirm your address will be sent to you soon'
      else
        flash[:error] = "Something went wrong: #{p.errors.fulll_messages}"
      end
      redirect_to :back
  end

  def authenticate_email
    p = Person.find_by(:authentication_token => params[:token])
    if p.nil?
      flash[:error] = "Sorry bad token"
    else
      p.authentication_token = nil
      p.save
      flash[:notice] = "Thank you for subscribing"
    end

    redirect_to blog_path
  end

end
