class WelcomeController < ApplicationController
  def index
  end

  def results
    @city = params[:city]
    @properties = Property.where(:city => @city).page params[:page]
    @criteria = params[:ordine]
  end

  def categories
    @categories = params[:categories]
    @ID_LOCALI = Array.new
    Property.all.each do |p|
      if (@categories - p.categories).empty?
        @ID_LOCALI << p.id
      end
    end
    @properties = Property.where(id: @ID_LOCALI).page params[:page]
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
