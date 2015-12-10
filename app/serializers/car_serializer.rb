class CarSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :year, :created_at, :updated_at
end
