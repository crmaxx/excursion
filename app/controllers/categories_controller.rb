class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @category_tours = @category.tours.includes(:city).active
  end
end
