require 'rails_helper'

RSpec.describe "Routes", :type => :routing do

  describe "UsersController" do
    it "routes get index" do
      expect(:get => "api/users").to route_to(
        :controller => "api/users",
        :action => "index"
      )
    end

    it "routes get new" do
      expect(:get => "api/users/new").to route_to(
        :controller => "api/users",
        :action => "new"
      )
    end

    it "routes get show" do
      expect(:get => "api/users/1").to route_to(
        :controller => "api/users",
        :action => "show",
        :id => "1"
      )
    end

    it "routes post create" do
      expect(:post => "api/users").to route_to(
        :controller => "api/users",
        :action => "create"
      )
    end

    it "routes get edit" do
      expect(:get => "api/users/1/edit").to route_to(
        :controller => "api/users",
        :action => "edit",
        :id => "1"
      )
    end

    it "routes put update" do
      expect(:put => "api/users/1").to route_to(
        :controller => "api/users",
        :action => "update",
        :id => "1"
      )
    end

    it "routes delete destroy" do
      expect(:delete => "api/users/1").to route_to(
        :controller => "api/users",
        :action => "destroy",
        :id => "1"
      )
    end
  end
end