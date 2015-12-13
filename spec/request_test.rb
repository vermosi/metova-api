it "won't work without authentication" do
  get garages_path
  expect(response.status).to be(401)
end

it "will work with authentication" do
  get garages_path, {}, valid_session
  expect(response.status).to be(200)
end