class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at
  delegate :current_user, to: :scope

  #def attributes
   # data = super
   # data[:edit_url] = edit_user_url(object) if current_user.admin?
   # data
end
