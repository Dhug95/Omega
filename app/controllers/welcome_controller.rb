class WelcomeController < ApplicationController
  def index
    @city = params[:city]
    @properties = Property.where(:city => @city)
  end

  def profile
    authenticate_user!
    @me = current_user
  end
end
