it "routes to #index" do
    expect(get: "/garages")/.to route_to("garages#index")
end