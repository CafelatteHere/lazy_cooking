class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :measurement
  has_many :recipe_ingredient_relations
  has_many :recipes,  through: :recipe_ingredient_relations
  # has_many :recipes, inverse_of: :ingredients, through: :recipe_ingredient_relations

  # with_options presence: true do
  #   validates :i_name, length: { maximum: 20 }
  # end
end
