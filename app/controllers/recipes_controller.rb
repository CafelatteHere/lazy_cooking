class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :define_recipe, only: [:edit, :update, :show, :destroy]
  before_action :redirect, only: %i[edit destroy]


  def index
    @recipes = Recipe.includes(:user).order(id: 'DESC')
  end

  def new
    @recipes_ingredient = RecipesIngredient.new
  end

  def create
    @recipes_ingredient = RecipesIngredient.new(recipes_ingredient_params)
    if @recipes_ingredient.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @recipes_ingredient = RecipesIngredient.new(recipe: @recipe)
  end

  def update
    @recipes_ingredient = RecipesIngredient.new(recipes_ingredient_params)
    @recipes_ingredient.recipe = @recipe
    if @recipes_ingredient.save
      redirect_to recipe_path(@recipe)
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
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
  end

  def define_recipe
    @recipe = Recipe.find(params[:id])
  end

  def redirect
    redirect_to recipe_path unless @recipe.user == current_user
  end
end
