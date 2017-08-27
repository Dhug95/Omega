class WelcomeController < ApplicationController
  def index
  end

  def results
    @city = params[:city]
    @criteria = params[:ordine]
    @categories = params[:categories]
    @ID_LOCALI = Array.new
    if @categories == nil
      @categories = [""]
    end
    Property.all.each do |p|
      if (@categories - p.categories).empty?
        @ID_LOCALI << p.id
      end
    end
    @properties = Property.where("id in (?) and city like ?", @ID_LOCALI, "%#{@city}%").page params[:page]
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
