class PagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def index
    @events = Event.all
  end
end
