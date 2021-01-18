class CalendarsController < ApplicationController
  # before_action :define_recipe, only: [:create]
  require "time"
  now = Time.new
  def index
    now = Time.new
    @month = now.month
    @day = now.day
    @i = now.wday
    @wdays = ['日', '月', '火', '水', '木', '金', '土', '日', '月', '火', '水', '木', '金', '土']
    @wday = @wdays[@i]
    if params[:calendar_params]
      render action: :create
    else
     @calendars = Calendar.all
     @calendar = Calendar.find_by(day: @cday)
    #  @id = @calendar.recipe_id

    #  @recipe = Recipe.find(params[:id])
    end
  end

#   def search
#     return nil if params[:keyword] == ""
#     recipe = Recipe.where(['name LIKE ?', "%#{params[:keyword]}%"])
#     render json:{ keyword: recipe }
# end

def new
  @calendar = Calendar.new
end

  def create
    # @calendar = Calendar.new
    @name = params[:calendar][:recipe_id]
    @recipe = Recipe.find_by(name: @name)
    params[:calendar][:recipe_id] = @recipe.id
    @calendar = Calendar.new(calendar_params)
    binding.pry
    if @calendar.valid?
      @calendar.save
      redirect_to '/calendars'
      flash[:notice] = "Saved!"
    else
      redirect_to '/calendars'
      flash[:alert] = "Failed!"
    end
  end

  private
  def calendar_params
    params.require(:calendar).permit(:day, :recipe_id)
  end

  def define_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
