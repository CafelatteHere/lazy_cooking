class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :measurement
  has_many :recipe_ingredient_relations
  has_many :recipe, through: :recipe_ingredient_relations

  with_options presence: true do
    validates :i_name, length: { maximum: 20 }
    validates :quantity
    validates :measurement_id, numericality: { other_than: 1 }
  end
end
