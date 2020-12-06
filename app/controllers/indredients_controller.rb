class IndredientsController < ApplicationController
  def new
    @ingredient = RecipesIngredient.new
  end

  def create
    @ingredient = RecipesIngredient.new(ingredient_params)
  end

  private

  def ingredient_params
    params.require(:recipes_ingredient).permit(:i_name, :quantity, :measurement_id)
  end
end
