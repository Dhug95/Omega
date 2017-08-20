class WelcomeController < ApplicationController
  def index
  end

  def results
    @city = params[:city]
    @properties = Property.where(:city => @city)
  end

  def profile
    authenticate_user!
    @me = current_user
  end
end
