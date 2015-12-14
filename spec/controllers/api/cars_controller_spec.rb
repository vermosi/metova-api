require 'rails_helper'
require 'auth_token'

RSpec.describe API::CarsController, :type => :controller do
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
        car1 = Car.create(make: 'Ford', model: 'Mustang', year: '1967')
        car2 = Car.create(make: 'Toyota', model: 'Mustang', year: '2015')
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        get :index
        expect(response.status).to eq(200)
        expect(assigns(:cars)).to eq([car1, car2])
      end
    end
  end

  describe "GET #show" do
    context 'without token' do
      it "making a request without token" do
        car1 = Car.create(make: 'Ford', model: 'Mustang', year: '1967')
        get :show, { id: car1.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        car1 = Car.create(make: 'Ford', model: 'Mustang', year: '1967')
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        get :show, { id: car1.id }
        expect(response.status).to eq(200)
        expect(assigns(:car)).to eq(car1)
      end
    end
  end

  describe "GET #destroy" do
    context 'without token' do
      it "making a request without token" do
        car1 = Car.create(make: 'Ford', model: 'Mustang', year: '1967')
        delete :destroy, { id: car1.id }
        expect(response.status).to eq(401)
      end
    end

    context 'with token' do
      it "making a request with token" do
        car1 = Car.create(make: 'Ford', model: 'Mustang', year: '1967')
        request.env['HTTP_AUTHORIZATION'] = AuthToken.encode({user_id: user.id })
        # delete :destroy, { id: car1.id }
        expect{
          delete :destroy, { id: car1.id }
        }.to change(Car, :count).by(-1)
      end
    end
  end
end
