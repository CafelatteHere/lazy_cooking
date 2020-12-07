class RecipesIngredient

  include ActiveModel::Model
  attr_accessor :i_name, :quantity, :measurement_id, :name, :image, :portion, :time_count_id, :how_to, :tips, :calories, :is_public

  with_options presence: true do
    validates :i_name
    validates :quantity
    validates :measurement_id
    validates :name
    validates :portion
    validates :time_count_id, numericality: {other_than: 1}
    validates :how_to
    validates :tips, allow_blank: true
    validates :calories, allow_blank: true
    validates :is_public
  end




  def save
    recipe = Recipe.create(name: name, image: image, portion: portion, time_count_id: time_count_id, how_to: how_to, tips: tips, calories: calories, is_public: is_public)
    ingredient = Ingredient.create(i_name: i_name, quantity: quantity, measurement_id: measurement_id)
    RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
  end
end