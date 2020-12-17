class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :measurement
  # has_many :recipe_ingredient_relations
  # has_many :recipes,  through: :recipe_ingredient_relations

  attr_accessor :i_name
  enumerize :i_name, in: %i(1 2 3 4 5)


end
