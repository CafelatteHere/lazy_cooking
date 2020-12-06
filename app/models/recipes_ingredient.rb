class RecipesIngredient

  include ActiveModel::Model
  attr_accessor :i_name, :quantity, :measurement_id, :name, :portion, :time, :how_to, :tips, :calories, :is_public

  with_options presence: true do
    validates :i_name
    validates :quantity
    validates :measurement_id
    validates :name
    validates :portion
    validates :time
    validates :how_to
    validates :tips
    validates :calories
    validates :is_public

  end
  # validates :time, allow_blank: true
  def save
    recipe = Recipe.create(name: name, portion: portion, time: time, how_to: how_to, tips: tips, calories: calories, is_public: is_public)
    ingredient = Ingredient.create(i_name: i_name, quantity: quantity, measurement_id: measurement.id)
    RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
  end
end