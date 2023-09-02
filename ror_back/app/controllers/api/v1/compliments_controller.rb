module Api
  module V1
    class ComplimentsController < ApplicationController
      before_action :authorize_user!, only: %i[create]

      def show
        compliment = Compliment.find_by(id: params[:id].to_i)

        return response = { status: :error_compliment_not_found }.to_json unless compliment

        if compliment.is_used == true
          response = { status: :is_used }.to_json
        else
          compliment.update!(is_used: true)
          response = { status: :ok }.merge!(compliment.attributes).to_json
        end
        render plain: response
      end

      def get_random
        compliment = Compliment.unused.random_order.first

        return response = { status: :error_compliment_not_found }.to_json unless compliment

        compliment.update!(is_used: true)
        response = { status: :ok }.merge!(compliment.attributes).to_json
        render plain: response
      end

      def get_sorted
        compliments = Compliment.all
        compliments = compliments.limit(params['limit']) if params['limit'] != 0
        compliments = compliments.offset(params['offset']) if params['offset'] != 0
        compliments = compliments.order(likes: :desc) if params['sorted_by'] == 'max-liked'
        compliments = compliments.order(:likes) if params['sorted_by'] == 'min-liked'
        response = compliments.to_json
        render plain: response
      end

      def create
        permit_params!(:compliment)

        @compliment = Compliment.create(compliment_text: params[:compliment],
                                       created_by_id: current_user.id)

      end

      def delete
        compliment = Compliment.find_by(id: params['id'].to_i)

        return response = { status: :error_you_are_not_logged_in }.to_json unless current_user

        return response = { status: :error_compliments_not_exist }.to_json unless compliment

        response = compliment.destroy.to_json
        render plain: response
      end

      def delete_all
        return response = { status: :error_you_are_not_logged_in }.to_json unless current_user

        response = { status: :error_access_not_allowed }.to_json unless current_user.admin?
        render plain: response
        # это работает, но ради безопасности закоменчено
        # Compliment.destroy_all
      end

      def like
        compliment = Compliment.find_by(id: params['id'].to_i)
        return { status: :error_compliment_not_found }.to_json unless compliment

        Compliment
          .where(id: params['id'].to_i)
          .update_all('likes = likes + 1')

        response = compliment.likes.to_json
        render plain: response
      end

      def unlike
        compliment = Compliment.find_by(id: params['id'].to_i)
        return { status: :error_compliment_not_found }.to_json unless compliment

        compliment.likes -= 1
        compliment.save!
        response = compliment.likes.to_json
        render plain: response
      end

      def dislike
        compliment = Compliment.find_by(id: params['id'].to_i)
        return { status: :error_compliment_not_found }.to_json unless compliment

        compliment.dislikes += 1
        compliment.save!
        response = compliment.dislikes.to_json
        render plain: response
      end
    end
  end
end
