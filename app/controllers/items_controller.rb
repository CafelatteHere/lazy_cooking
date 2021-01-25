class ItemsController < ApplicationController
  def index
    @calendars = Calendar.where(user_id: current_user.id)
    # binding.pry
    @items = Item.all
  end
end
