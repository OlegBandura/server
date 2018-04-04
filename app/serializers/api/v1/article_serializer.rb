# articles serializer
module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      attributes :id, :title, :text, :created_at, :updated_at
    end
  end
end
