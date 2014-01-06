class UsersController < ApplicationController
  before_filter :authenticate_user!

  layout 'ghost_train/application'

  def profile
    
  end

end
