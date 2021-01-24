class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :time_count
    has_one_attached :image
    belongs_to :user
    has_one :calendar
  # with_options presence: true do
  #   validates :name, length:{maximum: 35}
  #   validates :portion
  #   validates :how_to
  #   validates :is_public
  # end

  # with_options allow_blank: true do
  #   validates :time, length:{maximum: 10}
  #   validates :tips, length:{maximum: 255}
  #   validates :calories, length:{maximum: 4}
  # end
  has_many :recipe_ingredient_relations, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredient_relations, dependent: :destroy





#   after_initialize :create_ingredient

# def create_ingredient
#   @ingredient = RecipesIngredient.new
# end


end
