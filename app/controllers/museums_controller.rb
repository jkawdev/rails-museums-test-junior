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

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
      redirect_to museum_path(@museum)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @museum = Museum.find(params[:id])
    @museum.destroy
    redirect_to museums_path, status: :see_other
  end

  private

  def museum_params
    params.require(:museum).permit(:name, :address, :zipcode, :country, :visitors)
  end
end
