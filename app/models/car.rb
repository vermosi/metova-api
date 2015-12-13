class Car < ActiveRecord::Base
    belongs_to :garage
    belongs_to :user
end
