class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :cars

    def self.find_by_credentials(name, email)
        User.where(name: name, email: email).first
    end
    #before_create -> { self.auth_token = SecureRandom.hex }
end
