require 'test_helper'

class GaragesControllerTest < ActionController::TestCase
  def setup
    @controller = PostController.new
  end

  setup do
    @garage = garages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garages)
  end

  test "should create garage" do
    assert_difference('Garage.count') do
      post :create, garage: {  }
    end

    assert_response 201
  end

  test "should show garage" do
    get :show, id: @garage
    assert_response :success
  end

  test "should update garage" do
    put :update, id: @garage, garage: {  }
    assert_response 204
  end

  test "should destroy garage" do
    assert_difference('Garage.count', -1) do
      delete :destroy, id: @garage
    end

    assert_response 204
  end
end
