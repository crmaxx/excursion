class ToursController < ApplicationController
  def index
    @tours = Tour.active
  end

  def show
    current_user = AdminUser.first
    @activities = Tour.fetch_latest_from_queue(current_user)

    @tour = Tour.active.includes(:city, :categories).find_by(id: params[:id])
    @tour.add_to_queue!(current_user)
    @tour.trim_queue!(current_user)
  end
end
