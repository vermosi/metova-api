class CarSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :garage_id, :make, :model, :year, :created_at, :updated_at


end
