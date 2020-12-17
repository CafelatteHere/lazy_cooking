class RecipeIngredientRelation < ApplicationRecord
  # belongs_to  :recipe
  # belongs_to  :ingredient
  attr_accessor :quantity, :measurement_id
  enumerize :quantity, in: %i(1 2 3 4 5)
  enumerize :measurement_id, in: %i(1 2 3 4 5)
end
