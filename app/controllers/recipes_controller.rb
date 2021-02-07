class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  # before_action :redirect, only: %i[edit destroy]


  def index
    @recipes = Recipe.includes(:user).order(id: 'DESC')
  end

  def new
    @recipes_ingredient = RecipesIngredient.new(Recipe.new)
  end

  def create
    @recipes_ingredient = RecipesIngredient.new(Recipe.new)
    if @recipes_ingredient.validate(params[:recipes_ingredient])
    @recipes_ingredient.save
    end
    if true
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.first
    @recipe_ingredient_relations = @recipe.recipe_ingredient_relations.first
    @recipes_ingredient = RecipesIngredient.new(Recipe.find(params[:id]))
  end

  def update
    @recipes_ingredient = RecipesIngredient.new(Recipe.find(params[:id]))
    if @recipes_ingredient.validate(update_param)
      @recipes_ingredient.save
      redirect_to recipe_path(@recipe)
    else
      binding.pry
      render action: :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  def search
    # return nil if params[:keyword] == ""
    @recipes = Recipe.search(params[:keyword])
    # render json:{ keyword: tag }
  end

  private
  def recipes_ingredient_params
    params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, :ingredient, :recipe_ingredient_relations, :i_name, :quantity, :measurement_id).merge(user_id: current_user.id)
    # params.require(:recipes_ingredient).permit(:name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, ingredients_attributes: [:i_name], recipe_ingredient_relations_attributes: [:quantity, :measurement_id] ).merge(user_id: current_user.id)
  end

  def redirect
    redirect_to root_path unless @recipe.user == current_user
  end
end
