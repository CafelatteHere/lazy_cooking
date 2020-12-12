class RecipesIngredient

  include ActiveModel::Model
  attr_accessor :i_name, :quantity, :measurement_id, :name, :image, :portions, :time_count_id, :recipe, :tips, :calories, :is_public

  with_options presence: true do
    validates :i_name #, uniqueness: true
    validates :quantity, length:{maximum: 10}
    validates :measurement_id
    validates :name
    validates :portions
    validates :time_count_id, numericality: {other_than: 1}
    validates :recipe
    validates :tips, allow_blank: true
    validates :calories, allow_blank: true
    validates :is_public
  end


  # def ingredient_attributes=(ingredient_attributes)
  #   @recipe.ingredient_attributes= ingredient_attributes
  # end
  # def recipe_ingredient_relation=(recipe_ingredient_relation_attributes)

  #   @recipe.recipe_ingredient_relation_attributes= recipe_ingredient_relation_attributes
  # end


  # def ingredient
  #   @ingredient||= []
  # end
  # def recipe_ingredient_relation
  #   @recipe_ingredient_relation ||= []
  # end

  def save
    @recipe = Recipe.create(user_id: user.id, name: name, image: image, portions: portions, time_count_id: time_count_id, recipe: recipe, tips: tips, calories: calories, is_public: is_public)
  @recipe.save
    # ingredient = Ingredient.create(i_name: i_name, quantity: quantity, measurement_id: measurement_id)
    # ingredient = Ingredient.where(i_name: i_name).first_or_initialize
    @ingredient = Ingredient.create(i_name: i_name)
    recipe_ingredient_relation = RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id, quantity: quantity, measurement_id: measurement_id)

  end
end