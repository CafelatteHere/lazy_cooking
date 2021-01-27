class ItemsController < ApplicationController
  def index
    @calendars = Calendar.where(user_id: current_user.id)
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    end
      redirect_to '/items'
  end


  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
