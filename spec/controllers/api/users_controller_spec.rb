require 'rails_helper'
require 'auth_token'

RSpec.describe API::UsersController, :type => :controller do
  let!(:user) { User.create! email: 'test@example.com', password: 'abc.123.xyz'}

  describe "GET #index" do
    context 'without token' do
      it "making a request without token" do
        get :index
        expect(response.status).to eql(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe "GET #show" do
    context 'without token' do
      it "making a request without token" do
        user1 = User.create(email: 'kyle@example.com', password: 'kyleisbest123')
        get :show, { id: user.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        user1 = User.create(email: 'kyle@example.com', password: 'kyleisbest123')
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        get :show, { id: user1.id }
        expect(response.status).to eq(200)
        expect(assigns(:user)).to eq(user1)
      end
    end
  end

  describe "GET #destroy" do
    context 'without token' do
      it "making a request without token" do
        user1 = User.create(email: 'kyle@example.com', password: 'kyleisbest123')
        delete :destroy, { id: user1.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        user1 = User.create(email: 'kyle@example.com', password: 'kyleisbest123')
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        expect{
          delete :destroy, { id: user1.id }
        }.to change(User, :count).by(-1)
      end
    end
  end
end
