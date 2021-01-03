class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user)
  end

  def new
    @recipes_ingredient = RecipesIngredient.new
    # @recipe = RecipesIngredient.new
    # @ingredient = RecipesIngredient.new
    # @recipe_ingredient_relations = RecipesIngredient.new
  end

  def create
    @recipes_ingredient = RecipesIngredient.new(recipes_ingredient_params)
    @recipes_ingredient.save

    # @recipe = RecipesIngredient.new(recipes_ingredient_params)
    # @ingredient = RecipesIngredient.new(recipes_ingredient_params)
    # @recipe_ingredient_relations = RecipesIngredient.new(recipes_ingredient_params)

    if true
    # if @recipe.save && @ingredient.save && @recipe_ingredient_relations.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  # def edit
  #   @recipe = Recipe.find(params[:id])
  #   @ingredients = @recipe.ingredients
  #   @recipe_ingredient_relations = @recipe.recipe_ingredient_relations
  #   @recipes_ingredient = RecipesIngredient.new(name: @recipe.name, image: @recipe.image,
  #     portions: @recipe.portions, time_count_id: @recipe.time_count_id, content: @recipe.content,
  #     tips: @recipe.tips, calories: @recipe.calories, is_public: @recipe.is_public)

  #   # , quantity: recipe_ingredient_relations.quantity, measurement_id: recipe_ingredient_relations.measurement_id)


  #   # @recipe.save
  #   # redirect_to root_path
  # end

  # def update
  #   @recipe = Recipe.find(params[:id])
  #   @ingredients = @recipe.ingredients
  #   @recipe_ingredient_relations = @recipe.recipe_ingredient_relations
  #   # @recipes_ingredient = RecipesIngredient.new(params[:recipes_ingredient])
  #   if @recipe.update(recipes_ingredient_params)
  #     redirect_to root_path
  #   else
  #     render 'edit'
  #   end
  # end

  def show
    @recipe = Recipe.find(params[:id])
  end



  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end
  # def search
  #   return nil if params[:keyword] == ""
  #   ingredient = Ingredient.where(['i_name LIKE ?', "%#{params[:keyword]}%"])
  #   render json:{ keyword: tag }
  # end

  private

  def recipes_ingredient_params
    params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, :ingredient, :recipe_ingredient_relations, :i_name, :quantity, :measurement_id).merge(user_id: current_user.id)
    # params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, ingredients_attributes: [:i_name], recipe_ingredient_relations_attributes: [:quantity, :measurement_id] ).merge(user_id: current_user.id)
  end
end
