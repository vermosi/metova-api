require 'rails_helper'

RSpec.describe "Routes", :type => :routing do

  describe "CarsController" do
    it "routes get index" do
      expect(:get => "api/cars").to route_to(
        :controller => "api/cars",
        :action => "index"
      )
    end

    it "routes get new" do
      expect(:get => "api/cars/new").to route_to(
        :controller => "api/cars",
        :action => "new"
      )
    end

    it "routes get show" do
      expect(:get => "api/cars/1").to route_to(
        :controller => "api/cars",
        :action => "show",
        :id => "1"
      )
    end

    it "routes post create" do
      expect(:post => "api/cars").to route_to(
        :controller => "api/cars",
        :action => "create"
      )
    end

    it "routes get edit" do
      expect(:get => "api/cars/1/edit").to route_to(
        :controller => "api/cars",
        :action => "edit",
        :id => "1"
      )
    end

    it "routes put update" do
      expect(:put => "api/cars/1").to route_to(
        :controller => "api/cars",
        :action => "update",
        :id => "1"
      )
    end

    it "routes delete destroy" do
      expect(:delete => "api/cars/1").to route_to(
        :controller => "api/cars",
        :action => "destroy",
        :id => "1"
      )
    end
  end
end