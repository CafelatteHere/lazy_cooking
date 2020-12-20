class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    @recipes_ingredient = RecipesIngredient.new
  end

  def create
    @recipes_ingredient = RecipesIngredient.new(recipes_ingredient_params)


    if @recipes_ingredient.save
      redirect_to root_path
    else
      binding.pry
      render action: :new
    end
  end

  # def search
  #   return nil if params[:keyword] == ""
  #   ingredient = Ingredient.where(['i_name LIKE ?', "%#{params[:keyword]}%"])
  #   render json:{ keyword: tag }
  # end

  private

  def recipes_ingredient_params
    params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, ingredients_attributes: [:i_name], recipe_ingredient_relations_attributes: [:quantity, :measurement_id] ).merge(user_id: current_user.id)
  end
end
