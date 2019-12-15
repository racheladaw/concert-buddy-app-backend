module Api
  module V1
    class ConcertsController < ApplicationController

      def upcomingConcerts
        l = current_user.location

        # is there a better place to fetch concerts?
        data = l.get_concert_data
        data["events"].each do |event|
          concert = Concert.new(location_id: current_user.location_id)
          artist = Artist.find_or_create_by(name: event["performers"].first["name"])
          concert = Concert.find_or_create_by(location_id: current_user.location_id, artist: artist, date: event["datetime_local"].slice(0, 10))
          concert.price_range = "#{event["stats"]["lowest_price"]}-#{event["stats"]["highest_price"]}"
          if !concert.save
            render json: concert.errors.full_messages.to_sentence
          end
        end

        concerts = Concert.where("date >= ? and location_id = ?", Date.today, current_user.location_id)

        render json: ConcertSerializer.new(concerts).serialized_json
      end
    end
  end
end
