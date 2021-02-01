class ItemsController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to '/items'
  end

  def destroy_all
    Item.destroy_all
    redirect_to '/items'
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
