class ToursController < ApplicationController
  def index
    @tours = Tour.active
  end

  def show
    @tour = Tour.active.includes(:city, :categories).find_by(id: params[:id])
  end
end
