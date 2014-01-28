class ToursController < ApplicationController
  def index
    @tours = Tour.active
  end

  def show
    @user = AdminUser.first
    @tour = Tour.active.includes(:city, :categories).find_by(id: params[:id])
    @activities = Tour.fetch_latest_from_queue(@user)
  end
end
