class CitiesController < ApplicationController
  def index
    @cities = City.with_tours
  end

  def show
    @city = City.includes(:tours).find_by(id: params[:id])
    @city_tours = @city.tours.active
  end
end
