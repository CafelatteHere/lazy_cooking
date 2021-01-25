class Calendar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day
  # attr_accessor :recipe_id, :user_id

  belongs_to :recipe
  belongs_to :user
  has_one :item

  validates :day_id, presence: true
  # validates :recipe_id, presence: true
  # validates :recipe_id, presence: true

end
