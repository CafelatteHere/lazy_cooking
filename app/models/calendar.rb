class Calendar < ApplicationRecord
  # attr_accessor :recipe_id, :user_id

  has_one   :recipe
  belongs_to :user

  validates :day,    presence: true
  # validates :recipe_id, presence: true
  # validates :recipe_id, presence: true

end
