require 'test_helper'

class ListingGaragesTest < ActionDispatch::IntegrationTest

    setup { host! 'www.example.com'}

    test 'returns garage by id' do
        garage = Garage.create!(name: 'Rusty Old Shack')
        get "/garages/#{garage.id}"
        assert_equal 200, response.status

        garage_response = json(response.body)
        assert_includes garage.name, garage_response[:make]
    end
end