class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = RecipesIngredient.new
  end

  def create
    @recipe = RecipesIngredient.new(recipe_params)
    binding.pry
    # params[:recipe][:time] = time_join
    if @recipe.valid?
      binding.pry
      @recipe.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def recipe_params
    params.require(:recipes_ingredient).permit(:i_name, :quantity, :measurement_id, :name, :portion, :time, :how_to, :tips, :calories, :is_public)
  end

  # def time_join
  #   time = params[:recipe_ingredient][:time]
  #   Date.new time[time(1i)].to_i, time[time(2i)].to_i, time[time(3i)].to_i
  #   # Date.new time[time(1i)].to_i, time[time(2i)].to_i, time[time(3i)].to_i, time[time(4i)].to_i, time[time(5i)].to_i
  # end
end
