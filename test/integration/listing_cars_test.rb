require 'test_helper'

class ListingCarsTest < ActionDispatch::IntegrationTest

    setup { host! 'www.example.com'}

    test 'returns list of all cars by id' do
        nissan = Car.create!(make: 'Nissan', model: 'Sentra', year:)
        toyota = Car.create!(make: 'Toyota', model: 'Prius', year:)

        get "/cars/#{car.id}"
        assert_equal 200, response.status

        car_response = json(response.body)
        assert_includes car.make, car_response[:make]
    end
end