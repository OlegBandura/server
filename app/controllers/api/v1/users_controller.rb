module Api
  module V1
    # user controller
    class UsersController < ApplicationController
      # before_action :authenticate_user,  only: %i[index update current]
      # before_action :authorize_as_admin, only: [:destroy]
      # before_action :authorize,          only: [:update]

      def index
        render json: { status: 200, msg: 'Logged-in' }
      end

      def create
        user = User.create(user_params)
        render json: user
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
        end
      end

      def destroy
        user = User.find(params[:id]).destroy
        render json: user
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

    end
  end
end
