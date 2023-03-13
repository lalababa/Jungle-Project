class CategoriesController < ApplicationController

  before_action :authorize

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def show
    @category = Category.find params[:id]
  end
end