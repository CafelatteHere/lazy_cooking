class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    # @ingredient = RecipesIngredient.new(recipe: [Recipe.new])

    @recipe = RecipesIngredient.new
    @recipe.ingredients.build
    # @ingredient ||= []
    # @recipe_ingredient_relation ||= []
  end

  def create
    # @ingredient = RecipesIngredient.new(recipe_params)
    @recipe = RecipesIngredient.new(recipe_params)
    if @recipe.save
      if params[:ingredients]

       params[:ingredients].each { |ingredient|
         @recipe.ingredient.create(ingredient: ingredient)
       }
     end
     redirect_to root_path
   else
     redirect_to new_recipe_path
   end
    # @ingredient  ||= []

    # @recipe_ingredient_relation ||= []
    # @ingredient = RecipesIngredient.new(params[:ingredients_form])

    # if @recipe.valid?
    #   @recipe.save
    #   redirect_to root_path
    # else
    #   render action: :new
    # end
  end

  def search
    return nil if params[:keyword] == ""
    ingredient = Ingredient.where(['i_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end

  private

  def recipe_params
    params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :recipe, :tips, :calories, :is_public, ingredients_attributes: [:i_name], recipe_ingredient_relations_attributes: [:quantity, :measurement_id] ).merge(user_id: current_user.id)
  end


end
