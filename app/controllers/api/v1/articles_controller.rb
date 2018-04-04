module Api
  module V1
    # articles controller
    class ArticlesController < ApplicationController

      def index
        articles = Article.all
        render json: articles
      end

      def create
        article = Article.create(article_params)
        render json: article, status: 201, url: article
      end

      def show
        # article = Article.find(params[:id])
        # comment = Comment.where("article_id = ?", article.id)
        render json: Article.find(params[:id])
        # render json: {
        #   status: 'Success', message: 'Loaded article & comments', data: [
        #     article, comment
        #   ]
        #   }, status: :ok
      end

      def destroy
        Article.find(params[:id]).destroy
        head 204
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
        params.require(:article).permit(:title, :text)
      end
    end
  end
end
