class StaticPagesController < ApplicationController
  def home
    @cities = City.with_tours.includes(:tours)
  end
end
