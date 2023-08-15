class MuseumsController < ApplicationController
  def index
    @museums = Museum.all

    @markers = @museums.geocoded.map do |museum|
      {
        lat: museum.latitude,
        lng: museum.longitude
      }
    end

  end
end
