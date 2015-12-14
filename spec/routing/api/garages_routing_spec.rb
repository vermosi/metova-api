require 'rails_helper'

RSpec.describe "Routes", :type => :routing do

  describe "GaragesController" do
    it "routes get index" do
      expect(:get => "api/garages").to route_to(
        :controller => "api/garages",
        :action => "index"
      )
    end

    it "routes get new" do
      expect(:get => "api/garages/new").to route_to(
        :controller => "api/garages",
        :action => "new"
      )
    end

    it "routes get show" do
      expect(:get => "api/garages/1").to route_to(
        :controller => "api/garages",
        :action => "show",
        :id => "1"
      )
    end

    it "routes post create" do
      expect(:post => "api/garages").to route_to(
        :controller => "api/garages",
        :action => "create"
      )
    end

    it "routes get edit" do
      expect(:get => "api/garages/1/edit").to route_to(
        :controller => "api/garages",
        :action => "edit",
        :id => "1"
      )
    end

    it "routes put update" do
      expect(:put => "api/garages/1").to route_to(
        :controller => "api/garages",
        :action => "update",
        :id => "1"
      )
    end

    it "routes delete destroy" do
      expect(:delete => "api/garages/1").to route_to(
        :controller => "api/garages",
        :action => "destroy",
        :id => "1"
      )
    end
  end
end