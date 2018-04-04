module Api
  module V1
    #
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :password, :created_at, :updated_at
    end
  end
end
