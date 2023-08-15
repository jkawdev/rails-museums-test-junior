class MuseumsController < ApplicationController
  def index
    @museums = Museum.all

    @markers = @museums.geocoded.map do |museum|
      {
        lat: museum.latitude,
        lng: museum.longitude,
        # update to controller to pass window_info partial
        info_window_html: render_to_string(partial: "info_window", locals: { museum: museum })
      }
    end

  end
end
