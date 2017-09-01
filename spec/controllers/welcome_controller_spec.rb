require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET index" do
    it "gives a response status 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :index
      expect(response.content_type).to eq "text/html"
    end

    it "renders the home page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET results" do
    it "gives a response status 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :index
      expect(response.content_type).to eq "text/html"
    end

    it "renders the results page" do
      get :results
      expect(response).to render_template(:results)
    end
  end
end
