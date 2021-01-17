class Calendar < ApplicationRecord
  # attr_accessor :recipe_id

  has_many :recipes, dependent: :destroy
  validates :day,    presence: true
  # validates :recipe_id, presence: true
  # validates :recipe_id, presence: true

end
