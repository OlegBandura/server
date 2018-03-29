module Api
  module V1
    # articles controller
    class ArticlesController < ApplicationController

      def index

        articles = Article.all
        render json: {
          status: 'Success', message: 'Loaded articles', data: articles
          }, status: :ok
      end

      def create
        article = Article.new(article_params)
        if article.save
          render json: {
            status: 'Success', message: 'Saved articles', data: article
            }, status: :ok
        else
          render json: {
            status: 'Error', message: 'Not saved articles', data: article.errors
            }, status: :unprocessable_enttity
        end
      end

      def show
        article = Article.find(params[:id])
        comment = Comment.where("article_id = ?", article.id)
        render json: {
          status: 'Success', message: 'Loaded article & comments', data: [
            article, comment
          ]
          }, status: :ok

      end

      def destroy
        @article = Article.where(id: params[:id]).first
        if @article.destroy
          head(:ok)
        else
          head(:unprocessable_enttity)
        end
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {
            status: 'Success', message: 'updated articles', data: article
            }, status: :ok
        else
          render json: {
            status: 'Error', message: 'Not updated articles', data: article.errors
            }, status: :unprocessable_enttity
        end
      end

      private

      def article_params
        params.permit(:title, :text)
      end
    end
  end
end
