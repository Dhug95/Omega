class WelcomeController < ApplicationController
  def index
  end

  def results
    @city = params[:city]
    @properties = Property.where(:city => @city)
    @criteria = params[:ordine]
  end

  def profile
    authenticate_user!
    @me = current_user
  end
end
