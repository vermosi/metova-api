require 'rails_helper'
require 'auth_token'

RSpec.describe API::GaragesController, :type => :controller do
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
        garage1 = Garage.create(name: "Andy's Garage")
        get :show, { id: garage1.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        garage1 = Garage.create(name: "Andy's Garage")
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        get :show, { id: garage1.id }
        expect(response.status).to eq(200)
        expect(assigns(:garage)).to eq(garage1)
      end
    end
  end

  describe "GET #destroy" do
    context 'without token' do
      it "making a request without token" do
        garage1 = Garage.create(name: "Andy's Garage")
        delete :destroy, { id: garage1.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        garage1 = Garage.create(name: "Andy's Garage")
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        expect{
          delete :destroy, { id: garage1.id }
        }.to change(Garage, :count).by(-1)
      end
    end
  end
end
