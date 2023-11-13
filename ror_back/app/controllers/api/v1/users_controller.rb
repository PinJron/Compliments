# doc
module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_user!, only: %i[me logout]
      before_action :authorize_admin!, only: %i[update delete all]

      def login
        permit_params!(:name, :password)

        @user = find_user_by_name(permitted_params)

        return respond_with_error(:error_user_not_exists) unless @user
        return respond_with_error(:error_wrong_password) unless @user.authenticate(permitted_params[:password])

        session[:user_id] = @user.id
      end

      def register
        permit_params!(:name, :password)

        if User.where(name: permitted_params[:name]).exists?
          return respond_with_error(:error_user_exists)
        end

        user = User.create!(permitted_params)

        Rails.logger.info 'New view accessed'

        session[:user_id] = user.id

        respond_with_success(:user_succesfully_register)
      end

      def update
        candidate_params = %i[name role_id last_compliment_id password]
        permit_params!(*candidate_params)

        candidate = find_user_by_name(permitted_params)

        return respond_with_error(:error_user_not_exists) unless candidate

        candidate.update!(permitted_params)

        @user = candidate
      end

      def destroy
        permit_params!(:name)

        candidate = find_user_by_name(permitted_params)

        return respond_with_error(:error_user_not_exists) unless candidate

        candidate.destroy

        respond_with_success(:user_succesfully_deleted)
      end

      def all
        @all_users = User.all.to_a
      end

      def me
        @user = current_user
      end

      def profile
        permit_params!(:name)

        @user = find_user_by_name(permitted_params)

        respond_with_error(:error_user_not_found) unless @user
      end

      def logout
        session[:user_id] = nil

        respond_with_success(:succesfully_logout)
      end

      def change_password
        permit_params!(:id, :old_password, :new_password)

        return respond_with_error(:error_same_passwords) unless permitted_params[:old_password] != permitted_params[:new_password]

        @user = find_user_by_query_id(permitted_params)

        return respond_with_error(:error_user_not_exists) unless @user
        return respond_with_error(:error_wrong_password) unless @user.authenticate(permitted_params[:old_password])

        @user.update!(password: permitted_params[:new_password])
      end

      private

      def find_user_by_name(data)
        User.find_by(name: data[:name])
      end

      def find_user_by_query_id(data)
        User.find_by(name: data[:id])
      end
    end
  end
end
