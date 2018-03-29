module Api
  module V1
    # comments controller
    class CommentsController < ApplicationController
       before_action :authenticate_user, only: %i[auth create]

       def index
      #    render json: { service: 'auth-api', status: 200 }
       end

      def create
        article = Article.find(params[:article_id])
        comment = article.comments.new(comment_params)
        if comment.save
          render json: {
            status: 'Success', message: 'Comment added', data: comment
            }, status: :ok
        else
          render json: {
            status: 'Error', message: 'Comment NOT added', data: comment.errors
            }, status: :unprocessable_enttity
        end
      end

      def auth
        render json: { status: 200, msg: "You are currently Logged-in as
          #{current_user.email}"}
      end

      private

      def comment_params
        params.permit(:comment).merge(
          author: current_user.email
        )
      end
    end
  end
end
