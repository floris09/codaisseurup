class Api::CategoriesController < ApplicationController
  def index
    render status: 200, json: {
      categories: Category.all
      }.to_json
  end

  def show
    category = Category.find(params[:id])

    render status: 200, json: {
      category: category
    }.to_json
  end

  def create
    category = Category.new(category_params)

    if category.save
      render status: 201, json: {
        message: "Category created",
        category: category
      }.to_json
    else
      render status: 422, json: {
        errors: category.errors,
      }.to_json
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
