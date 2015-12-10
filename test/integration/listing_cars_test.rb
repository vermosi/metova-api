require 'test_helper'

class ListingCarsTest < ActionDispatch::IntegrationTest

    setup { host! 'www.example.com'}

    test 'returns car by id' do
        car = Car.create!(make: 'Nissan', model: 'Sentra', year: '2011')
        get "http://localhost:3000/api/cars/{#car.id}"
        assert_equal 200, response.status

        car_response = json(response.body)
        assert_includes car.make, car_response[:make]
    end
end