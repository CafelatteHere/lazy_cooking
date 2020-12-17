class RecipesIngredient

  include ActiveModel::Model
  extend Enumerize

  attr_accessor  :ingredients, :i_name, :recipe_ingredient_relations, :quantity, :measurement_id, :name, :image, :portions, :time_count_id, :recipe, :tips, :calories, :is_public, :user_id
  enumerize :i_name, in: %i(1 2 3 4 5)
  enumerize :quantity, in: %i(1 2 3 4 5)
  enumerize :measurement_id, in: %i(1 2 3 4 5)

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

  def ingredients
    @ingredients ||= []
  end

  def build_ingredients
    self.ingredients  =[Ingredient.new]*5
  end

  def ingredients_attributes=(attributes)
    @ingredients = attributes.map do |i, attribute|
      Ingredient.new(attribute)
    end
  end

  def recipe_ingredient_relations
    @recipe_ingredient_relations ||= []
  end

  def build_recipe_ingredient_relations
    self.recipe_ingredient_relations = [RecipeIngredientRelation.new]*5
  end

  def recipe_ingredient_relations_attributes=(attributes)
    @irecipe_ingredient_relations = attributes.map do |i, attribute|
      RecipeIngredientRelation.new(attribute)
    end
  end
  # def ingredients=(ingredients_attributes)

  #      @recipe.ingredients_attributes= ingredients_attributes
  #    end
  # def ingredients=(ingredients)
  #   @ingredients= ingredients
  # end

  # def recipe_ingredient_relation=(recipe_ingredient_relation)
  #   @recipe_ingredient_relation = recipe_ingredient_relation
  # end
  # def recipe_ingredient_relation=(recipe_ingredient_relation_attributes)

  #   @recipe.recipe_ingredient_relation_attributes= recipe_ingredient_relation_attributes
  # end


  # def ingredients
  #   @ingredients||= []
  # end
  # def recipe_ingredient_relation
  #   @recipe_ingredient_relation ||= []
  # end

  # def save
  #   recipe = Recipe.create(user_id: user_id, name: name, image: image, portions: portions, time_count_id: time_count_id, recipe: recipe, tips: tips, calories: calories, is_public: is_public)
  #   # ingredients = @recipes_ingredient.ingredients.build
  #   # ingredient = Ingredient.create(i_name: i_name, quantity: quantity, measurement_id: measurement_id)
  #   # ingredient = Ingredient.where(i_name: i_name).first_or_initialize
  #   ingredient = Ingredient.create(i_name: i_name)

  #   recipe_ingredient_relation = RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id, quantity: quantity, measurement_id: measurement_id)

  # end


end