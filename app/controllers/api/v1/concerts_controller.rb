module Api
  module V1
    class ConcertsController < ApplicationController

      def upcomingConcerts
        concerts = Concert.where("date >= ? and location_id = ?", Date.today, current_user.location_id)

        render json: ConcertSerializer.new(concerts).serialized_json
      end

      def getUpcomingConcertsFromSongkick
        l = current_user.location

        data = l.get_concert_data

        data["events"].each do |event|
          artist = Artist.find_or_create_by(name: event["performers"].first["name"])
          concert = Concert.find_or_create_by(location_id: current_user.location_id, artist: artist, date: event["datetime_local"].slice(0, 10))
          concert.price_range = "#{event["stats"]["lowest_price"]}-#{event["stats"]["highest_price"]}"


          if !concert.save
            render json: {error: concert.errors.full_messages.to_sentence}.to_json
          end
        end

        concerts = Concert.where("date >= ? and location_id = ?", Date.today, current_user.location_id)

        render json: ConcertSerializer.new(concerts).serialized_json

      end

      def getUsersOfConcert
        concert = Concert.find(concert_params)
        users = concert.users

        render json: UserSerializer.new(users).serialized_json
      end

      private

      def concert_params
        params.require(:concert_id)
      end
    end
  end
end
