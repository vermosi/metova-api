it "should have errors if created with no user or car id" do
  garage = Garage.create
  expect(garage.save).to eq(false)
  expect(garage.errors.messages).to have_key(:user)
  expect(garage.errors.messages).to have_key(:car)
end