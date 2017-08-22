class WelcomeController < ApplicationController
  def index
  end

  def results
    @city = params[:city]
    @properties = Property.where(:city => @city).page params[:page]
    @criteria = params[:ordine]
  end

  def profile
    authenticate_user!
    @me = current_user
  end

  def favourites
    authenticate_user!
    @properties = current_user.favourites.page params[:page]
  end

  def following
    authenticate_user!
    @properties = Property.where(:user_id => current_user.followings).page params[:page]
  end
end
