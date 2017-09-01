require "rails_helper"

RSpec.describe PropertiesController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "renders the properties list" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Create a new insertion" do
    it "renders the new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
