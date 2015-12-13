RSpec.describe UserController, type: :controller do
  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {id: user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    it "creates a new User" do
      expect {
        post :create, valid_attributes, valid_session
      }.to change(User, :count).by(1)
    end
  end
end