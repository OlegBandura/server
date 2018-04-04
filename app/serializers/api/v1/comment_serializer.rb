# commets serializer
module Api
  module V1
    class CommentSerializer < ActiveModel::Serializer
      attributes :id, :atricle_id, :author, :comment, :created_at, :updated_at
    end
  end
end
