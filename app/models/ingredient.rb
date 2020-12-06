class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :measurement
  has_many :recipe_ingredient_relations
  belongs_to :recipe, through: :recipe_ingredient_relations

  with_options, presence: true do
  validates :i_name, length: { maximum: 20 }
  validates :quantity, { maximum: 5 }
  validates :measurement_id, numericality: { other_than: 1 }
  end
end
