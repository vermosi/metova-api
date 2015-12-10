class User < ActiveRecord::Base
    has_many :cars

    #before_create -> { self.auth_token = SecureRandom.hex }
end
