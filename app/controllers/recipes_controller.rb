class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    @recipes_ingredient = RecipesIngredient.new
  end

  def create
    @recipes_ingredient = RecipesIngredient.new(recipe_params)


    if @recipes_ingredient.valid?
      @recipes_ingredient.save
      redirect_to root_path
    else
      binding.pry
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

  def recipe_params
    params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :recipe, :tips, :calories, :is_public, ingredients: [:id, :i_name], recipe_ingredient_relations: [:id, :quantity, :measurement_id] ).merge(user_id: current_user.id)
  end
end
