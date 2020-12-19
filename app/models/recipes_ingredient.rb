class RecipesIngredient

  include ActiveModel::Model

  concerning :RecipeBuilder do
    def recipe
      @recipe ||= Recipe.new
    end
  end

  concerning :IngredientsBuilder do
    attr_reader :ingredients_attributes

    def ingredients
      @ingredients_attributes ||= Ingredient.new
    end

    def ingredients_attributes=(attributes)
      @ingredients_attributes = Ingredient.new(attributes)
    end
  end

  concerning :RecipeIngredientRelationsBuilder do
    attr_reader :recipe_ingredient_relations_attributes

    def recipe_ingredient_relations
      @recipe_ingredient_relations_attributes ||= RecipeIngredientRelation.new
    end

    def recipe_ingredient_relations_attributes=(attributes)
      @recipe_ingredient_relations_attributes = RecipeIngredientRelation.new(attributes)
    end
  end

  attr_accessor :i_name, :quantity, :measurement_id, :name, :image, :portions, :time_count_id, :recipe, :tips, :calories, :is_public, :user_id

    with_options presence: true do
      validates :i_name #, uniqueness: true
      validates :quantity, length:{maximum: 10}, allow_blank: true
      validates :measurement_id, allow_blank: true
      validates :name
      validates :portions
      validates :time_count_id, numericality: {other_than: 1}
      validates :recipe
      validates :tips, allow_blank: true
      validates :calories, allow_blank: true
      validates :is_public
    end



  def save
    return false if invalid?

    recipe.assign_attributes(recipe_params)
    build_asscociations

    if recipe.save
      true
    else
      false
    end
  end

    # def validate_allparams
    # with_options presence: true do
    #   validates :i_name #, uniqueness: true
    #   validates :quantity, length:{maximum: 10}, allow_blank: true
    #   validates :measurement_id, allow_blank: true
    #   validates :name
    #   validates :portions
    #   validates :time_count_id, numericality: {other_than: 1}
    #   validates :recipe
    #   validates :tips, allow_blank: true
    #   validates :calories, allow_blank: true
    #   validates :is_public
    # end
  # end
  private

  def recipe_params
    {
      name: name,
      image: image,
      portions: portions,
      time_count_id: time_count_id,
      recipe: recipe,
      tips: tips,
      calories: calories,
      is_public: is_public
    }
  end

  def build_asscociations
    # recipe_ingredient_relations.ingredients << ingredients
    # recipe_ingredient_relations.recipes <<  recipes
    recipe.ingredients << ingredients
    recipe.recipe_ingredient_relations << recipe_ingredient_relations
  end



  #   recipe = Recipe.create(user_id: user_id, name: name, image: image, portions: portions, time_count_id: time_count_id, recipe: recipe, tips: tips, calories: calories, is_public: is_public)
  #   # ingredients = @recipes_ingredient.ingredients.build
  #   # ingredient = Ingredient.create(i_name: i_name, quantity: quantity, measurement_id: measurement_id)
  #   # ingredient = Ingredient.where(i_name: i_name).first_or_initialize
  #   ingredient = Ingredient.create(id: id, i_name: i_name)

  #   recipe_ingredient_relation = RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id, quantity: quantity, measurement_id: measurement_id)

  # end
end