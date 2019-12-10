module Api
  module V1
    class ConcertsController < ApplicationController
      def upcomingConcerts
        concerts = Concert.where(location_id: current_user.location_id, upcoming: true)

        render json: ConcertSerializer.new(concerts).serialized_json
      end
    end
  end
end
