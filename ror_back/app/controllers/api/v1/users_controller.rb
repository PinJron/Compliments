# doc
module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_user!, only: %i[me logout]
      before_action :authorize_admin!, only: %i[update delete all]

      def login
        permit_params!(:username, :password)

        @user = find_user_by_username(permitted_params)

        return respond_with_error(:error_user_not_exists) unless @user
        return respond_with_error(:error_wrong_password) unless @user.authenticate(permitted_params[:password])

        session[:user_id] = @user.id
      end

      def register
        permit_params!(:username, :password)

        if User.where(username: permitted_params[:username]).exists?
          return respond_with_error(:error_user_exists)
        end

        user = User.create!(permitted_params)

        session[:user_id] = user.id

        respond_with_success(:user_succesfully_register)
      end

      def update
        candidate_params = %i[username role_id last_compliment_id password]
        permit_params!(*candidate_params)

        candidate = find_user_by_username(permitted_params)

        return respond_with_error(:error_user_not_exists) unless candidate

        candidate.update!(permitted_params)

        @user = candidate
      end

      def delete
        permit_params!(:username)

        candidate = find_user_by_username(permitted_params)

        return respond_with_error(:error_user_not_exists) unless candidate

        candidate.destroy

        respond_with_success(:user_succesfully_deleted)
      end

      def all
        @all_users = User.all.to_a
      end

      def me
        authorize_user!

        @user = current_user
      end

      def logout
        authorize_user!

        session[:user_id] = nil

        respond_with_success(:succesfully_logout)
      end

      private

      def find_user_by_username(data)
        User.find_by(username: data[:username])
      end
    end
  end
end
