module Api
  module V1
    class SavedConcertsController < ApplicationController

      def create
        # byebug
        saved_concert = SavedConcert.new(saved_concert_params)

        if saved_concert.save
          concert = Concert.find(saved_concert.concert_id)
          render json: ConcertSerializer.new(concert).serialized_json, status: :created
        else
          response = {
            error: saved_concert.errors.full_messages.to_sentence
          }
          render json: response, status: :unprocessable_entity
        end
      end

      def index
        user = User.find(current_user.id)
        concerts = user.concerts

        render json: ConcertSerializer.new(concerts).serialized_json
      end

      private

      def saved_concert_params
        params.require(:saved_concert).permit(:concert_id, :user_id)
      end
    end
  end
end
