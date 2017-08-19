class WelcomeController < ApplicationController
  def index
  end

  def profile
    authenticate_user!
    @me = current_user
  end
end
