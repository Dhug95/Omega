require "rails_helper"

RSpec.describe PrenotationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prenotations").to route_to("prenotations#index")
    end

    it "routes to #new" do
      expect(:get => "/prenotations/new").to route_to("prenotations#new")
    end

    it "routes to #show" do
      expect(:get => "/prenotations/1").to route_to("prenotations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prenotations/1/edit").to route_to("prenotations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prenotations").to route_to("prenotations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/prenotations/1").to route_to("prenotations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/prenotations/1").to route_to("prenotations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prenotations/1").to route_to("prenotations#destroy", :id => "1")
    end

  end
end
