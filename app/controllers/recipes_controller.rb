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
    if @recipe.valid?
      @recipe.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def recipe_params
    params.require(:recipes_ingredient).permit(:i_name, :quantity, :measurement_id, :name, :portion, :time_count_id, :how_to, :tips, :calories, :is_public)
  end


end
