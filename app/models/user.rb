class User < ActiveRecord::Base
    has_many :cars

    def self.find_by_credentials(name, email)
        User.where(name: name, email: email).first
    end
    #before_create -> { self.auth_token = SecureRandom.hex }
end
