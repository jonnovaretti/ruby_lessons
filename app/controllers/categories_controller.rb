class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index; end

  def show
    @category = Category.find(params[:id])
  end

  def create
    category = Category.new(category_name_from_params)

    if category.save
      flash[:notice] = 'Category has been saved'
      redirect_to category
    else
      render 'new'
    end
  end

  private

  def category_name_from_params
    params.require(:category).permit(:name)
  end
end