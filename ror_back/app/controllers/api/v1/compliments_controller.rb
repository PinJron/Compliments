module Api
  module V1
    class ComplimentsController < ApplicationController
      before_action :authorize_user!, only: %i[create delete]
      before_action :authorize_admin!, only: %i[destroy_all]

      def index
        permit_params!(:id, :user_id)

        user = find_user_by_user_id(permitted_params)

        return respond_with_error(:error_user_not_found) unless user

        @all_compliments = user.compliments.all

        respond_with_error(:error_compliments_not_found) unless @all_compliments
      end

      def show
        permit_params!(:id, :user_id)

        user = find_user_by_user_id(permitted_params)

        @compliment = user.compliments.offset(permitted_params['id']).first

        respond_with_error(:error_compliment_not_found) unless @compliment
      end

      def random
        @compliment = Compliment.unused.random_order.first

        respond_with_error(:error_compliment_not_found) unless @compliment
      end

      def sorted
        permit_params!(:limit, :offset, :sorted_by)
        @all_compliments = Compliment.all
        @all_compliments = @all_compliments.limit(permitted_params['limit']) if permitted_params['limit'] != 0
        @all_compliments = @all_compliments.offset(permitted_params['offset']) if permitted_params['offset'] != 0
        @all_compliments = @all_compliments.order(likes: :desc) if permitted_params['sorted_by'] == 'max-liked'
        @all_compliments = @all_compliments.order(:likes) if permitted_params['sorted_by'] == 'min-liked'
        @all_compliments = @all_compliments.order(:compliment_text) if permitted_params['sorted_by'] == 'name'
      end

      def create
        permit_params!(:compliment)

        @compliment = @current_user.compliments.create!(compliment_text: permitted_params[:compliment])

        respond_with_error(:error_can_not_create_compliments) unless @compliment
      end

      def destroy
        @compliment = Compliment.find_by_id(params['id'])

        puts @compliment.inspect

        return respond_with_error(:error_compliment_not_exist) unless @compliment

        @compliment.destroy.to_json
      end

      def destroy_all
        return respond_with_error(:error_access_not_allowed) unless @current_user.admin?

        # это работает, но ради безопасности закоменчено
        Compliment.destroy_all
      end

      def like
        permit_params!(:id)

        @compliment = find_compliment_by_id(params['id'])

        return respond_with_error(:error_compliment_not_found) unless @compliment

        Compliment
          .where(id: params['id'])
          .update_all('likes = likes + 1')

        @compliment = find_compliment_by_id(params['id'])
      end

      def unlike
        permit_params!(:id)

        @compliment = find_compliment_by_id(params['id'])

        return respond_with_error(:error_compliment_not_found) unless @compliment

        Compliment
          .where(id: params['id'])
          .update_all('likes = likes - 1')

        @compliment = find_compliment_by_id(params['id'])
      end

      def dislike
        permit_params!(:id)

        @compliment = find_compliment_by_id(params['id'])

        return respond_with_error(:error_compliment_not_found) unless @compliment

        Compliment
          .where(id: params['id'])
          .update_all('dislikes = dislikes + 1')

        @compliment = find_compliment_by_id(params['id'])
      end

      def undislike
        permit_params!(:id)

        @compliment = find_compliment_by_id(params['id'])

        return respond_with_error(:error_compliment_not_found) unless @compliment

        Compliment
          .where(id: params['id'])
          .update_all('dislikes = dislikes - 1')

        @compliment = find_compliment_by_id(params['id'])
      end

      def created_by
        permit_params!(:name)

        user = find_user_by_name(permitted_params)

        @compliments = user.compliments.all
      end

      private

      def find_compliment_by_id(id)
        Compliment.find_by(id: id.to_i)
      end

      def find_user_by_name(data)
        User.find_by(name: data[:name])
      end

      def find_user_by_user_id(data)
        User.find_by(name: data[:user_id])
      end
    end
  end
end
